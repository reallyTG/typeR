library(tailDepFun)


### Name: selectGrid
### Title: Selects a grid of indices.
### Aliases: selectGrid

### ** Examples

selectGrid(cst = c(0,0.5,1), d = 3, nonzero = c(2,3))
locations <- cbind(rep(1:3, each = 3), rep(1:3,3))
selectGrid(c(0,1), d = 9, locations = locations, maxDistance = 1.5)



