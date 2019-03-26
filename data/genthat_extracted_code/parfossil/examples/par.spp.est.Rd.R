library(parfossil)


### Name: par.spp.est
### Title: A parallelized function for estimating species diversity
### Aliases: par.spp.est

### ** Examples

## Not run: 
##D #comparison of run times between the serial and parallel versions on the estimator
##D #please note that this example is designed for a multicore OS X or Linux computer
##D library(doMC)
##D registerDoMC()
##D data(fdata.mat)
##D system.time({spp.est(fdata.mat, rand = 100, abund = TRUE, counter = FALSE)})
##D system.time({par.spp.est(fdata.mat, rand = 100, abund = TRUE, counter = FALSE)})
##D 
##D #this example is for a multicore Windows computer, but HAS NOT BEEN TESTED
##D library(doSNOW)
##D library(snow)
##D cl <- makeCluster(c("localhost","localhost"), type = "SOCK")
##D registerDoSNOW(c1)
##D data(fdata.mat)
##D system.time({spp.est(fdata.mat, rand = 100, abund = TRUE, counter = FALSE)})
##D system.time({par.spp.est(fdata.mat, rand = 100, abund = TRUE, counter = FALSE)})
##D stopCluster(cl)
##D 
## End(Not run)



