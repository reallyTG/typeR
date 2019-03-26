library(dclone)


### Name: codaSamples
### Title: Generate posterior samples in mcmc.list format
### Aliases: codaSamples
### Keywords: models

### ** Examples

## Not run: 
##D model <- function() {
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
##D jdata <- dclone(list(N = N, Y = Y, x = x), 2, multiply="N")
##D jpara <- c("alpha", "beta", "sigma")
##D ## jags model
##D res <- jagsModel(file=model, data=jdata, n.chains = 3, n.adapt=1000)
##D nclones(res)
##D update(res, n.iter=1000)
##D nclones(res)
##D m <- codaSamples(res, jpara, n.iter=2000)
##D summary(m)
##D nclones(m)
## End(Not run)



