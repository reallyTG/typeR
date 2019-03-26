library(ReacTran)


### Name: setup.grid.2D
### Title: Creates a Finite Difference Grid over a Two-Dimensional
###   Rectangular Domain
### Aliases: setup.grid.2D
### Keywords: utilities

### ** Examples

# test of the setup.grid.2D functionality
x.grid  <- setup.grid.1D(x.up = 0, L = 10, N = 5)
y.grid  <- setup.grid.1D(x.up = 0, L = 20, N = 10)
(grid2D <- setup.grid.2D(x.grid, y.grid))




