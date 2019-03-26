library(parfossil)


### Name: par.nmds
### Title: A parallelized function for estimating species diversity
### Aliases: par.nmds

### ** Examples

## Not run: 
##D #comparison of run times between the serial and parallel versions on the estimator
##D #please note that this example is designed for a multicore OS X or Linux computer
##D library(doMC)
##D registerDoMC()
##D data(fdata.mat)
##D par.nmds(ecol.dist(fdata.mat))
## End(Not run)



