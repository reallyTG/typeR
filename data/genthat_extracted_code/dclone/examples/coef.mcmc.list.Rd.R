library(dclone)


### Name: mcmc.list-methods
### Title: Methods for the 'mcmc.list' class
### Aliases: dcsd dcsd.mcmc.list coef.mcmc.list confint.mcmc.list.dc
###   vcov.mcmc.list.dc vcov.mcmc.list quantile.mcmc.list
### Keywords: methods

### ** Examples

## Not run: 
##D ## simple regression example from the JAGS manual
##D jfun <- function() {
##D     for (i in 1:N) {
##D         Y[i] ~ dnorm(mu[i], tau)
##D         mu[i] <- alpha + beta * (x[i] - x.bar)
##D     }
##D     x.bar <- mean(x)
##D     alpha ~ dnorm(0.0, 1.0E-4)
##D     beta ~ dnorm(0.0, 1.0E-4)
##D     sigma <- 1.0/sqrt(tau)
##D     tau ~ dgamma(1.0E-3, 1.0E-3)
##D }
##D ## data generation
##D set.seed(1234)
##D N <- 100
##D alpha <- 1
##D beta <- -1
##D sigma <- 0.5
##D x <- runif(N)
##D linpred <- crossprod(t(model.matrix(~x)), c(alpha, beta))
##D Y <- rnorm(N, mean = linpred, sd = sigma)
##D ## data for the model
##D dcdata <- dclone(list(N = N, Y = Y, x = x), 5, multiply = "N")
##D ## data cloning
##D dcmod <- jags.fit(dcdata, c("alpha", "beta", "sigma"), jfun, 
##D     n.chains = 3)
##D summary(dcmod)
##D coef(dcmod)
##D dcsd(dcmod)
##D confint(dcmod)
##D vcov(dcmod)
##D vcov(dcmod, invfisher = FALSE)
##D quantile(dcmod)
## End(Not run)



