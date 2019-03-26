library(microplot)


### Name: as.includegraphics
### Title: Convert a filename into a complete 'LaTeX' '\includegraphics'
###   expression for use with 'LaTeX' '\includegraphics' macro in the
###   'graphicx' package.  This is used for 'pdf' and 'png' files with the
###   system 'pdflatex' command.  This is used for 'ps' files with the
###   system 'latex' command.
### Aliases: as.includegraphics as.includegraphics.default
###   as.includegraphics.trellis as.includegraphics.ggplot
###   as.includegraphics.graphicsList as.includegraphics.microplotMatrix
###   as.includegraphics.includegraphicsMatrix
### Keywords: documentation utilities

### ** Examples

as.includegraphics("abc.pdf")
## [1] "\setlength{\tabcolsep}{0pt}\begin{tabular}{c}
##      \includegraphics{/Users/rmh/Rwd/abc.def}\end{tabular}"
## attr(,"class")
## [1] "includegraphicsMatrix" "character"
## This form, with the full pathname, is required when the Hmisc::print.latex
## and related functions are used for automatic display of
## the current .tex file on screen.

as.includegraphics("abc.pdf", wd=".")
## [1] "\setlength{\tabcolsep}{0pt}\begin{tabular}{c}
##      \includegraphics{./abc.pdf}\end{tabular}"
## attr(,"class")
## [1] "includegraphicsMatrix" "character"
## This form, with the relative path, is optional when the .tex file will be
## embedded into a larger file, and will not be automatically displayed on screen.


## Please see the package documentation ?microplot for a simple example in context.

## Please see the demos for more interesting examples.
## demo(package="microplot")




