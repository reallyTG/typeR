library(Compositional)


### Name: Contour plot of the kernel density estimate in S^2
### Title: Contour plot of the kernel density estimate in S^2
### Aliases: comp.kerncontour
### Keywords: kernel density contour plot

### ** Examples

x <- as.matrix(iris[, 1:3])
x <- x / rowSums(x)
comp.kerncontour(x, type = "alr", n = 20)
comp.kerncontour(x, type = "ilr", n = 20)



