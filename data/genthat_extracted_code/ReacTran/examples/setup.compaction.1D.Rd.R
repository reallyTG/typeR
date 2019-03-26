library(ReacTran)


### Name: setup.compaction.1D
### Title: Calculates Advective Velocities of the Pore Water and Solid
###   Phase in a Water Saturated Sediment assuming Steady State Compaction
### Aliases: setup.compaction.1D
### Keywords: utilities

### ** Examples


# setup of the 1D grid

L <-10
grid <- setup.grid.1D(x.up = 0, L = L, N = 20)

# attaching an exponential porosity profile to the 1D grid
# this uses the "p.exp" profile function

por.grid <- setup.prop.1D(func = p.exp, grid = grid, 
                          y.0 = 0.9, y.inf = 0.5, x.att = 3)

# calculate the advective velocities

dummy <- setup.compaction.1D(v.0 = 1, por.0 = 0.9, por.inf = 0.5, 
                             por.grid = por.grid)
u.grid <- dummy$u
v.grid <- dummy$v

# plotting the results

par(mfrow = c(2, 1), cex.main = 1.2, cex.lab = 1.2)

plot(por.grid$int, grid$x.int, pch = 19, ylim = c(L,0), xlim = c(0,1),
     xlab = "", ylab = "depth [cm]", main = expression("porosity"),
     axes = FALSE)
abline(h = 0)
axis(pos = 0, side = 2)
axis(pos = 0, side = 3)

plot(u.grid$int, grid$x.int, type = "l", lwd = 2, col = "blue",
     ylim = c(L, 0), xlim = c(0, max(u.grid$int,v.grid$int)),
     xlab = "", ylab = "depth [cm]",
     main = "advective velocity [cm yr-1]", axes = FALSE)
abline(h = 0)
axis(pos = 0, side = 2)
axis(pos = 0, side = 3)

lines(v.grid$int, grid$x.int, lwd = 2, col = "red")

legend(x = "bottomright", legend = c("pore water","solid phase"),
       col = c("blue", "red"), lwd = 2)




