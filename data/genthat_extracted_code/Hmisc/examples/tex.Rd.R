library(Hmisc)


### Name: tex
### Title: function for use in graphs that are used with the psfrag package
###   in LaTeX
### Aliases: tex
### Keywords: hplot device

### ** Examples

## Not run: 
##D pdf('test.pdf')
##D x <- seq(0,15,length=100)
##D plot(x, dchisq(x, 5), xlab=tex('$x$'),
##D         ylab=tex('$f(x)$'), type='l')
##D title(tex('Density Function of the $\chi_{5}^{2}$ Distribution'))
##D dev.off()
##D # To process this file in LaTeX do something like
##D #\documentclass{article}
##D #\usepackage[scanall]{psfrag}
##D #\begin{document}
##D #\begin{figure}
##D #\includegraphics{test.ps}
##D #\caption{This is an example}
##D #\end{figure}
##D #\end{document}
## End(Not run)



