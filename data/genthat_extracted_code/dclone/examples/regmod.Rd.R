library(dclone)


### Name: regmod
### Title: Exemplary MCMC list object
### Aliases: regmod
### Keywords: datasets

### ** Examples

data(regmod)
summary(regmod)
plot(regmod)
## Not run: 
##D ## DATA GENERATION
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
##D regmod <- jags.fit(jdata, jpara, jfun, n.chains = 3,
##D     updated.model = FALSE)
## End(Not run)



