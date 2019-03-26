library(bamlss)


### Name: bamlss
### Title: Fit Bayesian Additive Models for Location Scale and Shape (and
###   Beyond)
### Aliases: bamlss
### Keywords: models regression

### ** Examples

## Not run: 
##D ## Simulated data example.
##D d <- GAMart()
##D f <- num ~ s(x1) + s(x2) + s(x3) + te(lon, lat)
##D b <- bamlss(f, data = d)
##D summary(b)
##D plot(b)
##D plot(b, which = 3:4)
##D plot(b, which = "samples")
##D 
##D ## Use of optimizer and sampler functions:
##D ## * first run optimizer,
##D b1 <- bamlss(f, data = d, optimizer = bfit, sampler = FALSE)
##D print(b1)
##D summary(b1)
##D 
##D ## * afterwards, start sampler with staring values,
##D b2 <- bamlss(f, data = d, start = coef(b1), optimizer = FALSE, sampler = GMCMC)
##D print(b2)
##D summary(b2)
##D 
##D ## Continue sampling.
##D b3 <- continue(b2, n.iter = 12000, burnin = 0, thin = 10)
##D plot(b3, which = "samples")
##D plot(b3, which = "max-acf")
##D plot(b3, which = "max-acf", burnin = 500, thin = 4)
## End(Not run)



