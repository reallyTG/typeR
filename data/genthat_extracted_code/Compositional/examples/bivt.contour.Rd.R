library(Compositional)


### Name: Contour plot of the t distribution in S^2
### Title: Contour plot of the t distribution in S^2
### Aliases: bivt.contour
### Keywords: contour plot bivariate t distribution

### ** Examples

x <- as.matrix( iris[, 1:3] )
x <- x / rowSums(x)
bivt.contour(x)
bivt.contour(x, type = "ilr")



