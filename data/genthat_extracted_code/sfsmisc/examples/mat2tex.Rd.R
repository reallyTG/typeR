library(sfsmisc)


### Name: mat2tex
### Title: Produce LaTeX commands to print a matrix
### Aliases: mat2tex
### Keywords: interface utilities

### ** Examples

mex <- matrix(c(pi,pi/2,pi/4,exp(1),exp(2),exp(3)),nrow=2, byrow=TRUE,
               dimnames = list(c("$\\pi$","$e$"),c("a","b","c")))
mat2tex( mex, title="$\\pi, e$, etc." )

## The last command produces the file "mat.tex" containing

##>  \begin{tabular} {| l|| c| c| c|}
##>  \multicolumn{ 4 }{c}{ $\pi, e$, etc. } \\ \hline
##>     \  & a & b & c \\ \hline \hline
##>  $\pi$ & 3.14 & 1.57 & 0.785 \\ \hline
##>  $e$ & 2.72 & 7.39 & 20.1 \\ \hline
##>  \end{tabular}

## Now you have to properly embed the contents of this file
## in a LaTeX document -- for example, you will need a
## preamble, the \begin{document} statement, etc.

## Note that the backslash needs protection in dimnames
## or title actions.

mat2tex(mex, stdout(), col.center = c("r","r","c"))



