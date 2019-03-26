library(dclone)


### Name: parCodaSamples
### Title: Generate posterior samples in 'mcmc.list' format on parallel
###   workers
### Aliases: parCodaSamples
### Keywords: models

### ** Examples

## Not run: 
##D if (require(rjags)) {
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
##D jdata <- list(N = N, Y = Y, x = x)
##D jpara <- c("alpha", "beta", "sigma")
##D ## jags model on parallel workers
##D ## n.chains must be <= no. of workers
##D cl <- makePSOCKcluster(4)
##D parJagsModel(cl, name="res", file=model, data=jdata,
##D     n.chains = 2, n.adapt=1000)
##D parUpdate(cl, "res", n.iter=1000)
##D m <- parCodaSamples(cl, "res", jpara, n.iter=2000)
##D stopifnot(2==nchain(m))
##D ## with data cloning
##D dcdata <- dclone(list(N = N, Y = Y, x = x), 2, multiply="N")
##D parJagsModel(cl, name="res2", file=model, data=dcdata,
##D     n.chains = 2, n.adapt=1000)
##D parUpdate(cl, "res2", n.iter=1000)
##D m2 <- parCodaSamples(cl, "res2", jpara, n.iter=2000)
##D stopifnot(2==nchain(m2))
##D nclones(m2)
##D stopCluster(cl)
##D }
## End(Not run)



