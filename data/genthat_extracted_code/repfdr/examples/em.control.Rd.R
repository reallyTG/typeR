library(repfdr)


### Name: em.control
### Title: Control Parameters for the EM algorithm
### Aliases: em.control

### ** Examples

## Not run: 
##D download.file('http://www.math.tau.ac.il/~ruheller/repfdr_RData/binned_zmat.RData',
##D   destfile = "binned_zmat.RData")
##D load(file = "binned_zmat.RData")
##D out <- repfdr(pbz,bz,"replication",
##D               control = em.control(pi.initial = c(0.48,rep(0.02,26)),
##D               verbose = TRUE, nr.threads = 1))
##D # iterations are printed; run bit slower (1 thread)
## End(Not run)



