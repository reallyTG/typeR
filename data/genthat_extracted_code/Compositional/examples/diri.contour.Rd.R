library(Compositional)


### Name: Contour plot of a Dirichlet distribution in S^2
### Title: Contour plot of a Dirichlet distribution in S^2
### Aliases: diri.contour
### Keywords: Dirichlet distribution contour plot

### ** Examples

x <- as.matrix( iris[, 1:3] )
x <- x / rowSums(x)
diri.contour( a = c(3, 4, 2) )



