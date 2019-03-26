library(synchrony)


### Name: plot.synchrony
### Title: Plot 'synchrony' objects
### Aliases: plot.synchrony

### ** Examples

comm.rand=matrix(runif(100), nrow=5, ncol=20)
comm.rand.sync=community.sync(comm.rand, nrands=20)
plot(comm.rand.sync)



