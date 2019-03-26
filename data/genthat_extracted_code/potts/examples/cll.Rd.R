library(potts)


### Name: composite.ll
### Title: Composite Log Likelihood for Potts Models
### Aliases: composite.ll gr.composite.ll
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
t_cache_two <- generate_t_cache(x, ncolor, t_stat, nrow*ncol/2, 2,
                                twopixel.nonoverlap)

composite.ll(theta[-1], t_stat, t_cache_mple)
gr.composite.ll(theta[-1], t_stat, t_cache_mple)

## Not run: 
##D optim.mple <- optim(theta.initial, composite.ll, gr=gr.composite.ll,
##D                     t_stat, t_cache_mple, method="BFGS",
##D                     control=list(fnscale=-1))
##D optim.mple$par
##D 
##D optim.two <- optim(theta.initial, composite.ll, gr=gr.composite.ll,
##D                    t_stat, t_cache_two, method="BFGS",
##D                    control=list(fnscale=-1))
##D optim.two$par
## End(Not run)

## Not run: 
##D # or use mclapply to speed things up.
##D library(multicore)
##D optim.two <- optim(theta.initial, composite.ll, gr=gr.composite.ll,
##D                    t_stat, t_cache_two, mclapply, method="BFGS",
##D                    control=list(fnscale=-1))
##D optim.two$par
##D 
## End(Not run)




