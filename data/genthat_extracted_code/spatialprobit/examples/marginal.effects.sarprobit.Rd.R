library(spatialprobit)


### Name: marginal.effects
### Title: Marginal effects for spatial probit and Tobit models (SAR
###   probit, SAR Tobit)
### Aliases: marginal.effects marginal.effects.sarprobit
###   marginal.effects.sartobit impacts.sarprobit impacts.sartobit

### ** Examples

## Not run: 
##D require(spatialprobit)
##D 
##D # number of observations
##D n <- 10
##D 
##D # true parameters
##D beta <- c(0, 1, -1)
##D rho <- 0.75
##D 
##D # design matrix with two standard normal variates as "covariates"
##D X <- cbind(intercept=1, x=rnorm(n), y=rnorm(n))
##D 
##D # sparse identity matrix
##D I_n <- sparseMatrix(i=1:n, j=1:n, x=1)
##D 
##D # number of nearest neighbors in spatial weight matrix W
##D m <- 6
##D 
##D # spatial weight matrix with m=6 nearest neighbors
##D W <- sparseMatrix(i=rep(1:n, each=m), 
##D   j=replicate(n, sample(x=1:n, size=m, replace=FALSE)), x=1/m, dims=c(n, n))
##D 
##D # innovations
##D eps <- rnorm(n=n, mean=0, sd=1)
##D 
##D # generate data from model 
##D S <- I_n - rho * W
##D z <- solve(qr(S), X %*% beta + eps)
##D y <- as.vector(z >= 0)  # 0 or 1, FALSE or TRUE
##D 
##D # estimate SAR probit model
##D set.seed(12345)
##D sarprobit.fit1 <- sar_probit_mcmc(y, X, W, ndraw=500, burn.in=100, 
##D   thinning=1, prior=NULL, computeMarginalEffects=TRUE)
##D summary(sarprobit.fit1)
##D 
##D # print impacts
##D impacts(sarprobit.fit1)
##D 
##D ################################################################################
##D #
##D # Example from LeSage/Pace (2009), section 10.3.1, p. 302-304
##D #
##D ################################################################################
##D 
##D # Value of "a" is not stated in book! 
##D # Assuming a=-1 which gives approx. 50##D 
##D  library(spatialprobit)
##D 
##D a <- -1   # control degree of censored observation
##D n <- 1000
##D rho <- 0.7
##D beta <- c(0, 2)
##D sige <- 0.5
##D I_n <- sparseMatrix(i=1:n, j=1:n, x=1)
##D x <- runif(n, a, 1)
##D X <- cbind(1, x)
##D eps <- rnorm(n, sd=sqrt(sige))
##D param <- c(beta, sige, rho)
##D 
##D # random locational coordinates and 6 nearest neighbors
##D lat <- rnorm(n)
##D long <- rnorm(n)
##D W <- kNearestNeighbors(lat, long, k=6)
##D 
##D y <- as.double(solve(I_n - rho * W) %*% (X %*% beta + eps))
##D table(y > 0)
##D 
##D # set negative values to zero to reflect sample truncation
##D ind <- which(y <=0)
##D y[ind] <- 0
##D 
##D # Fit SAR Tobit (with approx. 50% censored observations)
##D fit_sartobit <- sartobit(y ~ x,W,ndraw=1000,burn.in=200, showProgress=TRUE)
##D 
##D # print impacts
##D impacts(fit_sartobit)
## End(Not run)



