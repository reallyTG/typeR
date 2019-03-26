library(marcher)


### Name: fitNSD
### Title: Test range shift using net-squared displacement
### Aliases: fitNSD

### ** Examples

# simulate and compare two range shifts 
A <- 20
T <- 1:100
tau <- c(tau.z = 2, tau.v = 0)

# large disperal
Mu <- getMu(T, c(x1 = 0, y1 = 0, x2 = 4, y2 = 4, t1 = 40, dt = 20))
XY.sim <- simulate_shift(T, tau = tau, Mu, A=A)
with(XY.sim, scan_track(time = T, x = X, y = Y))
with(XY.sim, fitNSD(T, X, Y, plotme=TRUE))


# no disperal
Mu <- getMu(T, c(x1 = 0, y1 = 0, x2 = 0, y2 = 0, t1 = 40, dt = 20))
XY.sim <- simulate_shift(T, tau = tau, Mu, A=A)
with(XY.sim, scan_track(time = T, x = X, y = Y))
with(XY.sim, fitNSD(T,X,Y, plotme=TRUE))




