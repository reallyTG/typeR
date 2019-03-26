library(matrixProfile)


### Name: mass
### Title: Mueen's ultra-fast Algorithm for Similarity Search (MASS)
### Aliases: mass

### ** Examples

dt = AirPassengers
dt = as.vector(dt)
par(mfrow = c(2,1))
plot(dt, type = "l")
dm <- mass(q = dt[1:10], t = dt[-c(1:10)])
plot(dm, tyep = "l")



