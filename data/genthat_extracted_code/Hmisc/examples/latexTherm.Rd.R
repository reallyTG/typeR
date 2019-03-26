library(Hmisc)


### Name: latexTherm
### Title: Create LaTeX Thermometers and Colored Needles
### Aliases: latexTherm latexNeedle pngNeedle
### Keywords: utilities interface file character manip

### ** Examples

## Not run: 
##D # The following is in the Hmisc tests directory
##D # For a knitr example see latexTherm.Rnw in that directory
##D ct <- function(...) cat(..., sep='')
##D ct('\documentclass{report}\begin{document}\n')
##D latexTherm(c(1, 1, 1, 1), name='lta')
##D latexTherm(c(.5, .7, .4, .2), name='ltb')
##D latexTherm(c(.5, NA, .75, 0), w=.3, h=1, name='ltc', extra=0)
##D latexTherm(c(.5, NA, .75, 0), w=.3, h=1, name='ltcc')
##D latexTherm(c(0, 0, 0, 0), name='ltd')
##D ct('This is a the first:\lta and the second:\ltb\\ and the third
##D without extra:\ltc END\\\nThird with extra:\ltcc END\\ 
##D \vspace{2in}\\ 
##D All data = zero, frame only:\ltd\\
##D \end{document}\n')
##D w <- pngNeedle(c(.2, .5, .7))
##D cat(tobase64image(w))  # can insert this directly into an html file
## End(Not run)


