library(spatial)


### Name: Strauss
### Title: Simulates Strauss Spatial Point Process
### Aliases: Strauss
### Keywords: spatial

### ** Examples

towns <- ppinit("towns.dat")
par(pty="s")
plot(Kfn(towns, 10), type="b", xlab="distance", ylab="L(t)")
lines(Kaver(10, 25, Strauss(69,0.5,3.5)))



