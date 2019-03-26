library(spatial)


### Name: SSI
### Title: Simulates Sequential Spatial Inhibition Point Process
### Aliases: SSI
### Keywords: spatial

### ** Examples

towns <- ppinit("towns.dat")
par(pty = "s")
plot(Kfn(towns, 10), type = "b", xlab = "distance", ylab = "L(t)")
lines(Kaver(10, 25, SSI(69, 1.2)))



