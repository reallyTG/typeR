library(DiceOptim)


### Name: ParrConstraint
### Title: 2D constraint function
### Aliases: ParrConstraint

### ** Examples

n.grid <- 20
x.grid <- y.grid <- seq(0,1,length=n.grid)
design.grid <- expand.grid(x.grid, y.grid)
response.grid <- apply(design.grid, 1, ParrConstraint)
z.grid <- matrix(response.grid, n.grid, n.grid)
contour(x.grid,y.grid,z.grid,40)
title("Parr constraint function")



