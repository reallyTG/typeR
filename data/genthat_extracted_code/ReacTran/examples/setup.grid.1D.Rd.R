library(ReacTran)


### Name: setup.grid.1D
### Title: Creates a One-Dimensional Finite Difference Grid
### Aliases: setup.grid.1D plot.grid.1D
### Keywords: utilities

### ** Examples

# one zone, constant resolution
(GR <- setup.grid.1D(x.up = 0, L = 10, N = 10))
(GR <- setup.grid.1D(x.up = 0, L = 10, dx.1 = 1))
(GR <- setup.grid.1D(x.up = 0, L = 10, dx.N = 1))
plot(GR)

# one zone, constant resolution, origin not zero
(GR <- setup.grid.1D(x.up = 5, x.down = 10, N = 10))
plot(GR)

# one zone, variable resolution
(GR <- setup.grid.1D(x.up = 0, L = 10, dx.1 = 1, p.dx.1 = 1.2))
(GR <- setup.grid.1D(x.up = 0, L = 10, dx.N = 1, p.dx.N = 1.2))
plot(GR)

# one zone, variable resolution, imposed number of layers
(GR <- setup.grid.1D(x.up = 0, L = 10, N = 6, dx.1 = 1, p.dx.1 = 1.2))
(GR <- setup.grid.1D(x.up = 0, L = 10, N = 6, dx.N = 1, p.dx.N = 1.2))
plot(GR)

# one zone, higher resolution near upstream and downstream interfaces
(GR <- setup.grid.1D(x.up = 0, x.down = 10, dx.1 = 0.1,
                     p.dx.1 = 1.2, dx.N = 0.1, p.dx.N = 1.2))
plot(GR)

# one zone, higher resolution near upstream and downstream interfaces
# imposed number of layers 
(GR <- setup.grid.1D(x.up = 0, x.down = 10, N = 20, 
                     dx.1 = 0.1, p.dx.1 = 1.2, 
                     dx.N = 0.1, p.dx.N = 1.2))
plot(GR)

# two zones, higher resolution near the upstream
# and downstream interface
(GR<-setup.grid.1D(x.up = 0, L = c(5, 5), 
         dx.1 = c(0.2, 0.2), p.dx.1 = c(1.1, 1.1), 
         dx.N = c(0.2, 0.2), p.dx.N = c(1.1, 1.1)))
plot(GR)

# two zones, higher resolution near the upstream
# and downstream interface
# the number of grid cells in each zone is imposed via N
(GR <- setup.grid.1D(x.up = 0, L = c(5, 5), N = c(20, 10),
         dx.1 = c(0.2, 0.2), p.dx.1 = c(1.1, 1.1), 
         dx.N = c(0.2, 0.2), p.dx.N = c(1.1, 1.1)))
plot(GR)



