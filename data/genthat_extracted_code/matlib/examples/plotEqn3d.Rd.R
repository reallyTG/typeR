library(matlib)


### Name: plotEqn3d
### Title: Plot Linear Equations in 3D
### Aliases: plotEqn3d

### ** Examples

# three consistent equations in three unknowns
A <- matrix(c(13, -4, 2, -4, 11, -2, 2, -2, 8), 3,3)
b <- c(1,2,4)
plotEqn3d(A,b)



