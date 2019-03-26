library(Compositional)


### Name: Total variability
### Title: Total variability
### Aliases: totvar

### ** Examples

x <- as.matrix(iris[, 1:4])
x <- x / rowSums(x)
totvar(x)



