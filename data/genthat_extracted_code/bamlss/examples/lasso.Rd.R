library(bamlss)


### Name: la
### Title: Lasso Smooth Constructor
### Aliases: la lasso lasso.plot lasso.stop lasso.coef lasso.transform
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulated fusion Lasso example.
##D bmu <- c(0,0,0,2,2,2,4,4,4)
##D bsigma <- c(0,0,0,-2,-2,-2,-1,-1,-1)
##D id <- factor(sort(rep(1:length(bmu), length.out = 300)))
##D 
##D ## Response.
##D set.seed(123)
##D y <- bmu[id] + rnorm(length(id), sd = exp(bsigma[id]))
##D 
##D ## Estimate model:
##D ## fuse=1 -> nominal fusion,
##D ## fuse=2 -> ordinal fusion,
##D ## first, unpenalized model to be used for adaptive fusion weights.
##D f <- list(y ~ la(id,fuse=2,fx=TRUE), sigma ~ la(id,fuse=1,fx=TRUE))
##D b0 <- bamlss(f, sampler = FALSE)
##D 
##D ## Model with single lambda parameter.
##D f <- list(y ~ la(id,fuse=2), sigma ~ la(id,fuse=1))
##D b1 <- bamlss(f, sampler = FALSE, optimizer = lasso,
##D   criterion = "BIC", zeromodel = b0)
##D 
##D ## Plot information criterion and coefficient paths.
##D lasso.plot(b1, which = 1)
##D lasso.plot(b1, which = 2)
##D lasso.plot(b1, which = 2, model = "mu", name = "mu.s.la(id).id")
##D lasso.plot(b1, which = 2, model = "sigma", name = "sigma.s.la(id).id")
##D 
##D ## Extract coefficients for optimum Lasso parameter.
##D coef(b1, mstop = lasso.stop(b1))
##D 
##D ## Predict with optimum Lasso parameter.
##D p1 <- predict(b1, mstop = lasso.stop(b1))
##D 
##D ## Full MCMC, needs lasso.transform() to assign the
##D ## adaptive weights from unpenalized model b0.
##D b2 <- bamlss(f, optimizer = FALSE, transform = lasso.transform,
##D   zeromodel = b0, nobs = length(y), start = coef(b1, mstop = lasso.stop(b1)),
##D   n.iter = 4000, burnin = 1000)
##D summary(b2)
##D plot(b2)
##D 
##D ci <- confint(b2, model = "mu", pterms = FALSE, sterms = TRUE)
##D lasso.plot(b1, which = 2, model = "mu", name = "mu.s.la(id).id", spar = FALSE)
##D for(i in 1:8) {
##D   abline(h = ci[i, 1], lty = 2, col = "red")
##D   abline(h = ci[i, 2], lty = 2, col = "red")
##D }
## End(Not run)



