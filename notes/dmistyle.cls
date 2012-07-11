\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dmistyle}[2012/07/10 Personal template by Dave Ingram]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper,10pt]{article}

\usepackage{savetrees}

\usepackage{pstricks}
\usepackage{xcolor}
\usepackage[T1]{fontenc}
\usepackage{DejaVuSerif}
\usepackage{dashrule}

\definecolor{colH1}{HTML}{224488}
\definecolor[ps]{pscolH1}{HTML}{224488}
\definecolor{colH2}{HTML}{218477}
\definecolor[ps]{pscolH2}{HTML}{218477}
\definecolor{colH3}{HTML}{A96F38}
\definecolor[ps]{pscolH3}{HTML}{A96F38}

\makeatletter
\newsavebox\@dmi@headingBox
\newlength\@dmi@headingMargin
\setlength\@dmi@headingMargin{2pt}
\newcommand\wrapheading[3]{
	\savebox\@dmi@headingBox{%
		\raisebox{\dimexpr\depth+\@dmi@headingMargin\relax}
		[\dimexpr\totalheight+2\@dmi@headingMargin\relax]{\hspace\@dmi@headingMargin#3\hspace\@dmi@headingMargin}}

	\newdimen\@dmi@barWidth
	\newdimen\@dmi@barOffset
	\newdimen\@dmi@headingWidth
	\newdimen\@dmi@headingHeight
	\@dmi@headingWidth=\wd\@dmi@headingBox
	\@dmi@headingHeight=\ht\@dmi@headingBox
	\@dmi@barWidth=#2
	\@dmi@barOffset=\dimexpr\@dmi@headingWidth-0.5\@dmi@barWidth\relax
	\begin{pspicture}(\@dmi@headingWidth,\@dmi@headingHeight)
		\psline[linecolor=#1,linestyle=dashed,dash=1pt 1pt,linewidth=1pt](0,0)(\@dmi@headingWidth,0)
		\psline[linecolor=#1,linestyle=solid,linewidth=\@dmi@barWidth](\@dmi@barOffset,-0.5pt)(\@dmi@barOffset,\@dmi@headingHeight)
		\rput[lb](0,0){\usebox{\@dmi@headingBox}}
	\end{pspicture}
}

\def\section{\@ifstar\unnumberedsection\unnumberedsection}
\def\numberedsection{\@ifnextchar[%]
  \numberedsectionwithtwoarguments\numberedsectionwithoneargument}
\def\unnumberedsection{\@ifnextchar[%]
  \unnumberedsectionwithtwoarguments\unnumberedsectionwithoneargument}
\def\numberedsectionwithoneargument#1{\numberedsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsectionwithoneargument#1{\unnumberedsectionwithtwoarguments[#1]{#1}}
\def\numberedsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 3ex\goodbreak
  \refstepcounter{section}%
  \vbox{%
    \hbox to \hsize{%
			\vbox{%
				\hbox to \hsize{%
					\hbox to 1cm{\hss\bfseries\Large\thesection.\ }%
					\vtop{%
						\advance \hsize by -1cm
						\parindent=0pt
						\leavevmode\raggedright\bfseries\Large
						\raisebox{2pt}{\strut}%
						#2
						}}%
				}}%
				\noindent \color{colH1} \hdashrule[4pt][x]{\hsize}{1pt}{1pt}
    }\nobreak
  \vskip 2mm\nobreak
  \addcontentsline{toc}{section}{%
    \protect\numberline{\thesection}%
    #1}%
  \ignorespaces
  }
\def\unnumberedsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 2ex\goodbreak
%  \refstepcounter{section}%
	\begingroup
	\parindent=0pt
	\wrapheading{colH1}{6pt}{\vbox{%
    \advance \hsize by -2\@dmi@headingMargin
    \hbox to \hsize{%
			\vtop{%
					\leavevmode\raggedright\bfseries\Large
					\raisebox{2pt}{\strut}%
					#2
				}}%
    }}
	\endgroup\nobreak
  \vskip -3mm\nobreak
  \addcontentsline{toc}{section}{%
%    \protect\numberline{\thesection}%
    #1}%
	\ignorespaces
	}

\def\subsection{\@ifstar\unnumberedsubsection\unnumberedsubsection}
\def\numberedsubsection{\@ifnextchar[%]
  \numberedsubsectionwithtwoarguments\numberedsubsectionwithoneargument}
\def\unnumberedsubsection{\@ifnextchar[%]
  \unnumberedsubsectionwithtwoarguments\unnumberedsubsectionwithoneargument}
\def\numberedsubsectionwithoneargument#1{\numberedsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsectionwithoneargument#1{\unnumberedsubsectionwithtwoarguments[#1]{#1}}
\def\numberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 2ex\goodbreak
  \refstepcounter{subsection}%
  \vbox{%
    \hbox to \hsize{%
			\vbox{%
				\hbox to \hsize{%
					\hbox to 1cm{\hss\bfseries\Large\thesubsection.\ }%
					\vtop{%
						\advance \hsize by -1cm
						\parindent=0pt
						\leavevmode\raggedright\bfseries\large
						\raisebox{2pt}{\strut}%
						#2
						}}%
				}}%
				\noindent \color{colH2} \hdashrule[4pt][x]{\hsize}{1pt}{1pt}
    }\nobreak
  \vskip 2mm\nobreak
  \addcontentsline{toc}{subsection}{%
    \protect\numberline{\thesubsection}%
    #1}%
  \ignorespaces
  }
\def\unnumberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 2ex\goodbreak
%  \refstepcounter{subsection}%
	\begingroup
	\parindent=0pt
	\wrapheading{colH2}{4pt}{\vbox{%
    \advance \hsize by -2\@dmi@headingMargin
    \hbox to \hsize{%
			\vtop{%
				\leavevmode\raggedright\bfseries\large
				\raisebox{2pt}{\strut}%
				#2
				}}%
			}}
		\endgroup\nobreak
  \vskip -4mm\nobreak
  \addcontentsline{toc}{subsection}{%
%    \protect\numberline{\thesubsection}%
    #1}%
	\ignorespaces
	}

\def\subsubsection{\@ifstar\unnumberedsubsubsection\unnumberedsubsubsection}
\def\numberedsubsubsection{\@ifnextchar[%]
  \numberedsubsubsectionwithtwoarguments\numberedsubsubsectionwithoneargument}
\def\unnumberedsubsubsection{\@ifnextchar[%]
  \unnumberedsubsubsectionwithtwoarguments\unnumberedsubsubsectionwithoneargument}
\def\numberedsubsubsectionwithoneargument#1{\numberedsubsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsubsectionwithoneargument#1{\unnumberedsubsubsectionwithtwoarguments[#1]{#1}}
\def\numberedsubsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 3ex\goodbreak
  \refstepcounter{subsubsection}%
  \vbox{%
    \hbox to \hsize{%
			\vbox{%
				\hbox to \hsize{%
					\hbox to 1cm{\hss\bfseries\normalsize\thesubsubsection.\ }%
					\vtop{%
						\advance \hsize by -1cm
						\parindent=0pt
						\leavevmode\raggedright\bfseries\normalsize
						\raisebox{2pt}{\strut}%
						#2
						}}%
				}}%
				\noindent \color{colH3} \hdashrule[4pt][x]{\hsize}{1pt}{1pt}
    }\nobreak
  \vskip 2mm\nobreak
  \addcontentsline{toc}{subsubsection}{%
    \protect\numberline{\thesubsubsection}%
    #1}%
  \ignorespaces
  }
\def\unnumberedsubsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 1.5ex\goodbreak
%  \refstepcounter{subsubsection}%
	\begingroup
	\parindent=0pt
	\wrapheading{colH3}{2pt}{\vbox{%
    \advance \hsize by -2\@dmi@headingMargin
    \hbox to \hsize{%
			\vtop{%
				\leavevmode\raggedright\bfseries\normalsize
				#2
				}}%
			}}
		\endgroup\nobreak
  \vskip -4.5mm\nobreak
  \addcontentsline{toc}{subsubsection}{%
%    \protect\numberline{\thesubsubsection}%
    #1}%
	\ignorespaces
	}

\parskip=4pt plus 4pt
\parindent=9pt
\setcounter{secnumdepth}{0}

% reduced spacing on itemize
\newenvironment{itemize*}%
  {\begin{itemize}%
    \setlength{\itemsep}{0pt}%
    \setlength{\parskip}{0pt}}%
  {\end{itemize}}

% vim: ft=tex
