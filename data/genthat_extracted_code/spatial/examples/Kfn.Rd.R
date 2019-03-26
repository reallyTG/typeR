library(spatial)


### Name: Kfn
### Title: Compute K-fn of a Point Pattern
### Aliases: Kfn
### Keywords: spatial

### ** Examples

towns <- ppinit("towns.dat")
par(pty="s")
plot(Kfn(towns, 10), type="s", xlab="distance", ylab="L(t)")



