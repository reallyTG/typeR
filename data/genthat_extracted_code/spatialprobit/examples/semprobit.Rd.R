library(spatialprobit)


### Name: semprobit
### Title: Bayesian estimation of the SEM probit model
### Aliases: sem_probit_mcmc semprobit

### ** Examples

## Not run: 
##D library(Matrix)
##D # number of observations
##D n <- 200
##D 
##D # true parameters
##D beta <- c(0, 1, -1)
##D sige <- 2
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
##D # W must not have non-zeros in the main diagonal!
##D i <- rep(1:n, each=m)
##D j <- rep(NA, n * m)
##D for (k in 1:n) {
##D   j[(((k-1)*m)+1):(k*m)] <- sample(x=(1:n)[-k], size=m, replace=FALSE)
##D }
##D W <- sparseMatrix(i, j, x=1/m, dims=c(n, n))
##D 
##D # innovations
##D eps <- sqrt(sige)*rnorm(n=n, mean=0, sd=1)
##D 
##D # generate data from model 
##D S <- I_n - rho * W
##D z <- X %*% beta + solve(qr(S), eps)
##D y <- as.double(z >= 0)  # 0 or 1, FALSE or TRUE
##D 
##D # estimate SEM probit model
##D semprobit.fit1 <- semprobit(y ~ X - 1, W, ndraw=500, burn.in=100, 
##D   thinning=1, prior=NULL)
##D summary(semprobit.fit1)
## End(Not run)



