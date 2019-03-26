library(kohonen)


### Name: summary.kohonen
### Title: Summary and print methods for kohonen objects
### Aliases: summary.kohonen print.kohonen
### Keywords: classif

### ** Examples

data(wines)
xyf.wines <- xyf(scale(wines), classvec2classmat(vintages),
                 grid = somgrid(5, 5, "hexagonal"))
xyf.wines
summary(xyf.wines)



