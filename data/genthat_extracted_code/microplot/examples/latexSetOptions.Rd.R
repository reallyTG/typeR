library(microplot)


### Name: latexSetOptions
### Title: Set the options for use of latex; check whether the options for
###   latex functions have been specified.
### Aliases: latexSetOptions latexCheckOptions
### Keywords: utilities

### ** Examples

## Not run: 
##D   latexSetOptions() ## default
##D   latexSetOptions("pdflatex") ## same as default
##D   latexSetOptions("pdflatex", "pdf", "open") ## same as default on Macintosh, Windows, SMP Unix
##D 
##D   latexSetOptions("latex")
##D   latexSetOptions("latex", "dvi", "dvips") ## same as above
##D 
##D   latexSetOptions(NULL)
##D   latexSetOptions(NULL, NULL, NULL) ## same as above
## End(Not run)



