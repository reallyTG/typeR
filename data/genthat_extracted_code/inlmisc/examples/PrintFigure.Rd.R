library(inlmisc)


### Name: PrintFigure
### Title: Print as LaTeX Figure
### Aliases: PrintFigure
### Keywords: print

### ** Examples

## Not run: 
##D cat("\\documentclass{article}",
##D     "\\usepackage[labelsep=period, labelfont=bf]{caption}",
##D     "\\usepackage{subcaption}",
##D     "\\captionsetup[figure]{skip=5pt}",
##D     "\\captionsetup[subfigure]{skip=-5pt, labelfont={bf, it}}",
##D     "\\renewcommand{\\thesubfigure}{\\Alph{subfigure}}",
##D     "\\begin{document}\n",
##D     "<<id, echo=FALSE, fig.width=3, fig.height=2, results='asis'>>=",
##D     "par(mar=c(2.1, 2.1, 1.1, 1.1))",
##D     "fig <- sprintf('plot(runif(%s))', 1:9)",
##D     "headings <- sprintf('Subfigure caption, n=%s', 1:9)",
##D     "PrintFigure(fig, 3, 2, 'id', title='Figure caption', headings=headings)",
##D     "@\n",
##D     "\\end{document}",
##D     file = "figure-example.Rnw", sep = "\n")
##D knitr::knit2pdf("figure-example.Rnw", clean = TRUE)  # requires TeX installation
##D system("open figure-example.pdf")
##D 
##D unlink("figure-example.*")
##D unlink("figure", recursive = TRUE)
## End(Not run)




