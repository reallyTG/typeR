library(spatial)


### Name: Psim
### Title: Simulate Binomial Spatial Point Process
### Aliases: Psim
### Keywords: spatial

### ** Examples

towns <- ppinit("towns.dat")
par(pty="s")
plot(Kfn(towns, 10), type="s", xlab="distance", ylab="L(t)")
for(i in 1:10) lines(Kfn(Psim(69), 10))



