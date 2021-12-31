%% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{variant}[Covid Variant]

%% Preliminary definitions, needed by the options
% \newcommand{\headlinecolor}{\normalcolor}
% \RequirePackage{xcolor}
% \definecolor{slcolor}{HTML}{882B21}

%% This parts handles the options passed to the class.
% \DeclareOption{onecolumn}{\OptionNotUsed}
% \DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
% \DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% \ProcessOptions\relax
\LoadClass{article}

% Packages
\RequirePackage[legalpaper, portrait, margin=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage[style=nature,maxbibnames=99,sorting=ydnt]{biblatex}
\RequirePackage{longtable}

%% Body of the class, most of the declarations appear here.
%% Definitions
\newcommand\institution[1]{\def\@institution{#1}}
\newcommand\email[1]{\def\@email{#1}}
\newcommand\address[1]{\def\@address{#1}}
\newcommand\github[1]{\def\@github{\url{#1}}}
\newcommand\fullauthor[1]{\def\@fullauthor{#1}}
\newcommand{\sep}{$\bullet$}
\newcommand{\noheader}{\def\@noheader}

% Header
\fancypagestyle{plain}
{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \@ifundefined{@noheader}{
        \rhead{
            {\ifdefined\@fullauthor
                \@fullauthor
             \else
                \@author
            \fi}
        }
        \lhead{\@title}
    }{}
}

%% Title
\urlstyle{same}
\renewcommand{\maketitle}{%
    \fontsize{11}{12}\selectfont
    {\begin{center}
        {\fontseries{b}\selectfont\@author}\\
        \vspace{11pt}
        {\ifdefined\@institution \@institution \else\fi}
        {\ifdefined\@address 
            {\ifdefined\@institution \sep \else\fi} 
        \else\fi} 
        {\ifdefined\@address \@address \else\fi}
        {\ifdefined\@address \\ \else
            {\ifdefined\@institution \\ \else\fi} 
        \fi} 
        {\ifdefined\@email 
            \href{mailto:\@email}{\@email} 
        \else\fi}
        {\ifdefined\@email
            {\ifdefined\@github \sep \else\fi} 
        \else\fi} 
        {\ifdefined\@github \@github \else\fi}
    \end{center}}
    \pagestyle{plain}
}

\renewcommand{\section}{%
    \@startsection
    {section}{1}{0pt}{-1.5ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}{\fontsize{11}{12}\selectfont}%
}

\renewcommand{\normalsize}{\fontsize{11}{12}\selectfont}
% \setlength{\textwidth}{17.5cm}
% \setlength{\textheight}{22cm}

% No section counting
\setcounter{secnumdepth}{0}

\newcommand\split[4]{
    \begin{minipage}[t]{#1\textwidth}#3\end{minipage}%
    \hspace{0.05\textwidth}%
    \begin{minipage}[t]{#2\textwidth}#4\end{minipage}
}

% \newcommand\split[4]{
%     \begin{longtable}{p{#1\textwidth} p{#2\textwidth}}
%     #3 & #4 \\
%     \end{longtable}
% }

\DeclareFieldFormat{labelnumberwidth}{}
\setlength{\biblabelsep}{0pt}
\DeclareFieldFormat{title}{}
\defbibheading{vhack}[References]{\vspace{-8pt}}

\setlength\bibitemsep{11pt}
