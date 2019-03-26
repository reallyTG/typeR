library(ldr)


### Name: core
### Title: Covariance Reduction
### Aliases: core

### ** Examples

data(flea)
fit1 <- core(X=flea[,-1], y=flea[,1], numdir.test=TRUE)
summary(fit1)

## Not run: 
##D data(snakes)
##D fit2 <- ldr(Sigmas=snakes[-3], ns=snakes[[3]], numdir = 4, 
##D 	model = "core", numdir.test = TRUE, verbose=TRUE, 
##D 	sim_anneal = TRUE, max_iter = 200, max_iter_sa=200)
##D summary(fit2)
## End(Not run)



