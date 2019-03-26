library(ReacTran)


### Name: setup.prop.2D
### Title: Attaches a Property to a Two-Dimensional Grid
### Aliases: setup.prop.2D contour.prop.2D
### Keywords: utilities

### ** Examples

# Inverse quadratic function 
inv.quad <- function(x, y, a = NULL, b = NULL)
   return(1/((x-a)^2+(y-b)^2))


# Construction of the 2D grid 
x.grid <- setup.grid.1D (x.up = 0, L = 10, N = 10)
y.grid <- setup.grid.1D (x.up = 0, L = 10, N = 10)
grid2D <- setup.grid.2D (x.grid, y.grid)

# Attaching the inverse quadratic function to the 2D grid 
(twoD <- setup.prop.2D (func = inv.quad, grid = grid2D, a = 5, b = 5))

# show 
contour(log(twoD$x.int))




