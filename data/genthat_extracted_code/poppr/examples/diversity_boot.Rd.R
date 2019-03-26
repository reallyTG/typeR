library(poppr)


### Name: diversity_boot
### Title: Perform a bootstrap analysis on diversity statistics
### Aliases: diversity_boot

### ** Examples

library(poppr)
data(Pinf)
tab <- mlg.table(Pinf, plot = FALSE)
diversity_boot(tab, 10L)
## Not run: 
##D # This can be done in a parallel fashion (OSX uses "multicore", Windows uses "snow")
##D system.time(diversity_boot(tab, 10000L, parallel = "multicore", ncpus = 4L))
##D system.time(diversity_boot(tab, 10000L))
## End(Not run)



