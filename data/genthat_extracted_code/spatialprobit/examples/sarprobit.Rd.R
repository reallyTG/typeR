library(spatialprobit)


### Name: sarprobit
### Title: Bayesian estimation of the SAR probit model
### Aliases: sar_probit_mcmc sarprobit

### ** Examples

library(Matrix)
set.seed(2)

# number of observations
n <- 100

# true parameters
beta <- c(0, 1, -1)
rho <- 0.75

# design matrix with two standard normal variates as "covariates"
X <- cbind(intercept=1, x=rnorm(n), y=rnorm(n))

# sparse identity matrix
I_n <- sparseMatrix(i=1:n, j=1:n, x=1)

# number of nearest neighbors in spatial weight matrix W
m <- 6

# spatial weight matrix with m=6 nearest neighbors
# W must not have non-zeros in the main diagonal!
i <- rep(1:n, each=m)
j <- rep(NA, n * m)
for (k in 1:n) {
  j[(((k-1)*m)+1):(k*m)] <- sample(x=(1:n)[-k], size=m, replace=FALSE)
}
W <- sparseMatrix(i, j, x=1/m, dims=c(n, n))


# innovations
eps <- rnorm(n=n, mean=0, sd=1)

# generate data from model 
S <- I_n - rho * W
z <- solve(qr(S), X %*% beta + eps)
y <- as.vector(z >= 0)  # 0 or 1, FALSE or TRUE

# estimate SAR probit model
sarprobit.fit1 <- sar_probit_mcmc(y, X, W, ndraw=100, thinning=1, prior=NULL)
summary(sarprobit.fit1)



