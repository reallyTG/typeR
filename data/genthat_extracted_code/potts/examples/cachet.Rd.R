library(potts)


### Name: Cache T
### Title: Cache calculated Canonical Statistics for Potts Models.
### Aliases: generate_t_cache gengridcache gensingleton singleton
###   gentwopixel twopixel twopixel.nonoverlap genfourpixel fourpixel
###   fourpixel.nonoverlap genthreebythree ninepixel.nonoverlap
###   genfourbyfour sixteenpixel.nonoverlap
### Keywords: misc

### ** Examples


ncolor <- 4
beta   <- log(1+sqrt(ncolor))
theta  <- c(rep(0,ncolor), beta)

nrow <- 32
ncol <- 32

x <- matrix(sample(ncolor, nrow*ncol, replace=TRUE), nrow=nrow, ncol=ncol)
foo <- packPotts(x, ncolor)
out <- potts(foo, theta, nbatch=10)
x <- unpackPotts(out$final)

t_stat <- calc_t(x, ncolor)
t_cache_mple <- generate_t_cache(x, ncolor, t_stat, nrow*ncol, 1,
                                 singleton)

## Not run: 
##D # use multicore to speed things up.
##D library(multicore)
##D t_cache_mple <- generate_t_cache(x, ncolor, t_stat, nrow*ncol, 1,
##D                                  singleton, fapply=mclapply)
## End(Not run)




