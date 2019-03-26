library(mixlink)


### Name: Metropolis-Hastings Sampler
### Title: Metropolis-Hastings Sampler
### Aliases: 'Metropolis-Hastings Sampler' rwmetrop.mixlink.binomial
###   'Metropolis-Hastings Sampler' rwmetrop.mixlink.poisson
###   'Metropolis-Hastings Sampler'

### ** Examples

## Not run: 
##D library(Matrix)
##D 
##D # ----- Generate data -----
##D n <- 200
##D x <- runif(n, 1, 3)
##D X <- model.matrix(~ x)
##D Beta.true <- c(0, 1)
##D mean.true <- exp(X %*% Beta.true)
##D kappa.true <- 0.95
##D Pi.true <- c(1,3)/4
##D d <- ncol(X)
##D J <- length(Pi.true)
##D y <- r.mixlink.pois(n, mean.true, Pi.true, kappa.true)
##D 
##D # ----- Run Metropolis-within-Gibbs sampler -----
##D hyper <- list(VBeta = diag(1000, d), alpha.Pi = rep(1, J),
##D 	kappa.a = 1, kappa.b = 1/2)
##D proposal <- list(
##D var = bdiag(solve(t(X) %*% X), diag(J-1), 1),
##D scale = 0.5)
##D metrop.out <- rwmetrop.mixlink.poisson(y, X, R = 20000, burn = 1000,
##D 	thin = 10, Pi.init = c(1,9)/10, hyper = hyper,
##D 	report.period = 1000, use.laplace.approx = TRUE, proposal = proposal)
##D 
##D print(metrop.out)
##D DIC(metrop.out)
## End(Not run)




