library(spatialprobit)


### Name: plot.sarprobit
### Title: Plot Diagnostics for 'sarprobit', 'semprobit' or 'sartobit'
###   objects
### Aliases: plot.sarprobit plot.semprobit plot.sartobit

### ** Examples

## Not run: 
##D library(Matrix)
##D # number of observations
##D n <- 200
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
##D fit1 <- sar_probit_mcmc(y, X, W, ndraw=500, burn.in=100, thinning=1, prior=NULL)
##D plot(fit1, which=c(1,3))
## End(Not run)



