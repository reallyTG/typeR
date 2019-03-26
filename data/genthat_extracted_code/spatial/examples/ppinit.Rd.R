library(spatial)


### Name: ppinit
### Title: Read a Point Process Object from a File
### Aliases: ppinit
### Keywords: spatial

### ** Examples

towns <- ppinit("towns.dat")
par(pty="s")
plot(Kfn(towns, 10), type="b", xlab="distance", ylab="L(t)")



