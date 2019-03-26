library(microplot)


### Name: latex.trellis
### Title: Display a table in 'latex' containing panels from R graphs in
###   its cells.
### Aliases: latex.trellis latex.ggplot latex.graphicsList
###   latex.microplotMatrix latex.includegraphicsMatrix latex.graphicsClass
### Keywords: documentation utilities LaTeX

### ** Examples

## See the examples in the help files, the demo files, and in the
## examples subdirectory.

## The example here shows how to locate the generated .tex file and the displayed .pdf file.
## The .tex file can be brought into a larger .tex file with an \include statement.
## The .pdf file can be brought into a larger .tex file with an \includegraphics statement.

## Not run: 
##D ## These are the settings for my machines
##D ## Set options for Hmisc::latex
##D latexSetOptions()
##D 
##D mpgGraph <- lattice::xyplot(mpg ~ wt, group=factor(cyl), data=mtcars,
##D                             xlim=c(.8, 6.2), ylim=c(9,37),
##D                             pch=as.character(levels(factor(mtcars$cyl))), cex=2)
##D mpgGraph ## on your interactive device
##D mpgLatex <-
##D   latex(mpgGraph,
##D         height.panel=2, width.panel=3, ## inch. pick numbers that look right to you.
##D         height.x.axis=.37, width.y.axis=.44,  ## inch. these require trial and error.
##D         height.xlab=.18, width.ylab=.27,      ## inch. these require trial and error.
##D         rowname=NULL,    ## suppress rownames, see ?latex
##D         colheads=FALSE)  ## suppress colnames, see ?latex
##D print.default(mpgLatex)  ## file is in your working directory
##D mpgPdf <- dvi(mpgLatex)
##D print.default(mpgPdf) ## File is in a temporary directory.
##D                       ## If Macintosh shows "//", replace by "/" before using.
##D mpgPdf
##D 
## End(Not run)
## Sweave users can bring the generated files directly into their
## document.  See the discussion of the \code{file} argument in
## \code{\link[Hmisc]{latex}} to learn how to use this feature with
## Sweave.



