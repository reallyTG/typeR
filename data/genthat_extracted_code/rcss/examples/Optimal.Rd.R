library(rcss)


### Name: Optimal
### Title: Optimal
### Aliases: Optimal

### ** Examples

grid <- as.matrix(cbind(rep(1, 81), c(seq(20, 60, length = 91))))
tangent <- matrix(rnorm(81 * 2), ncol = 2)
Optimal(grid, tangent)



