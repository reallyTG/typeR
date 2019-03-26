library(ReacTran)


### Name: setup.prop.1D
### Title: Attaches a Property to a One-Dimensional Grid
### Aliases: setup.prop.1D plot.prop.1D
### Keywords: utilities

### ** Examples


# Construction of the 1D grid 

grid <- setup.grid.1D(x.up = 0, L = 10, N = 10)

# Porosity profile via function specification

P.prof <- setup.prop.1D(func = p.exp, grid = grid, y.0 = 0.9,
                        y.inf = 0.5, x.att = 3)

# Porosity profile via data series interpolation

P.data <- matrix(ncol = 2, data = c(0,3,6,10,0.9,0.65,0.55,0.5))
P.spline <- setup.prop.1D(xy = P.data, grid = grid)
P.linear <- setup.prop.1D(xy = P.data, grid = grid, interpolate = "linear")

# Plot different profiles 

plot(P.prof, grid = grid, type = "l",
     main = "setup.prop, function evaluation")
points(P.data, cex = 1.5, pch = 16) 
lines(grid$x.int, P.spline$int, lty = "dashed")
lines(grid$x.int, P.linear$int, lty = "dotdash")



