library(dclone)


### Name: update.mcmc.list
### Title: Automatic updating of an MCMC object
### Aliases: update.mcmc.list updated.model
### Keywords: models htest

### ** Examples

## Not run: 
##D ## simple regression example from the JAGS manual
##D jfun <- function() {
##D     for (i in 1:N) {
##D         Y[i] ~ dnorm(mu[i], tau)
##D         mu[i] <- alpha + beta * (x[i] - x.bar)
##D     }
##D     x.bar <- mean(x[])
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
##D ## list of data for the model
##D jdata <- list(N = N, Y = Y, x = x)
##D ## what to monitor
##D jpara <- c("alpha", "beta", "sigma")
##D ## fit the model with JAGS
##D regmod <- jags.fit(jdata, jpara, jfun, n.chains = 3)
##D ## get the updated model
##D upmod <- updated.model(regmod)
##D upmod
##D ## automatic updating
##D ## using R_hat < 1.1 as criteria
##D critfun <- function(x)
##D     all(gelman.diag(x)$psrf[,1] < 1.1)
##D mod <- update(regmod, critfun, 5)
##D ## update just once
##D mod2 <- update(regmod)
##D summary(mod)
## End(Not run)



