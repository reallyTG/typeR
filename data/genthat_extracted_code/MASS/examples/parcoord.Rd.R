library(MASS)


### Name: parcoord
### Title: Parallel Coordinates Plot
### Aliases: parcoord
### Keywords: hplot

### ** Examples

parcoord(state.x77[, c(7, 4, 6, 2, 5, 3)])

ir <- rbind(iris3[,,1], iris3[,,2], iris3[,,3])
parcoord(log(ir)[, c(3, 4, 2, 1)], col = 1 + (0:149)%/%50)



