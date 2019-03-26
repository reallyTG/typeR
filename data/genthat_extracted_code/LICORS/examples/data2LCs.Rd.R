library(LICORS)


### Name: data2LCs
### Title: Iterate over (N+1)D field and get all LC configurations
### Aliases: data2LCs
### Keywords: manip

### ** Examples

set.seed(1)
AA <- matrix(rnorm(200), ncol = 10)
LC_geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 2, FLC = 0), shape = "cone")
bb <- data2LCs(t(AA), LC.coordinates = LC_geom$coordinates)
image2(bb$PLC)
plot(density(bb$FLC))

# a time series example
data(nottem)
xx <- nottem
LC_geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 24, FLC = 3), space.dim = 0)
bb <- data2LCs(xx, LC.coordinates = LC_geom$coordinates)
image2(bb$PLC)
plot(density(bb$FLC))



