library(MOEADr)


### Name: find_nondominated_points
### Title: Find non-dominated points
### Aliases: find_nondominated_points

### ** Examples

Y  <- matrix(runif(200), ncol = 2)
nd <- find_nondominated_points(Y)
plot(Y[, 1], Y[, 2], type = "p", pch = 20, las = 1)
points(Y[nd, 1], Y[nd, 2], type = "p", pch = 16, col = 2, cex = 1.5)




