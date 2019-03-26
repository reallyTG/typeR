library(Compositional)


### Name: Ternary diagram
### Title: Ternary diagram
### Aliases: ternary
### Keywords: ternary plot visualisation

### ** Examples

library(MASS)
x <- as.matrix(fgl[, 2:4])
ternary(x, means = FALSE)
x <- as.matrix(iris[, 1:3])
ternary(x, pca = TRUE)



