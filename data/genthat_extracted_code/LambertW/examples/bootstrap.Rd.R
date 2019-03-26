library(LambertW)


### Name: bootstrap
### Title: Bootstrap Lambert W x F estimates
### Aliases: bootstrap bootstrap.LambertW_fit

### ** Examples

## Not run: 
##D yy <- rLambertW(n = 1000, theta = list(delta = c(0.1), beta = c(2, 1)), 
##D                 distname = "normal")
##D mod.igmm <- IGMM(yy, type = "h")
##D boot.est <- bootstrap(mod.igmm, R = 100) 
##D # use summary and plot from 'boot' pkg
##D plot(boot.est, 3)
##D summary(boot.est)
## End(Not run)



