## ---- results='hide', message=FALSE, warning=FALSE-----------------------
set.seed(1234)
library(knockoff)

## ------------------------------------------------------------------------
# Problem parameters
n = 1000         # number of observations
p = 1000         # number of variables
k = 60           # number of variables with nonzero coefficients
amplitude = 7.5  # signal amplitude (for noise level = 1)

# Generate the variables from a multivariate normal distribution
mu = rep(0,p)
rho = 0.10
Sigma = toeplitz(rho^(0:(p-1)))
X = matrix(rnorm(n*p),n) %*% chol(Sigma)

# Generate the response from a logistic model and encode it as a factor.
nonzero = sample(p, k)
beta = amplitude * (1:p %in% nonzero) / sqrt(n)
invlogit = function(x) exp(x) / (1+exp(x))
y.sample = function(x) rbinom(n, prob=invlogit(x %*% beta), size=1)
y = factor(y.sample(X), levels=c(0,1), labels=c("A","B"))

## ------------------------------------------------------------------------
X_k = create.gaussian(X, mu, Sigma)

## ---- results='hide', message=FALSE, warning=FALSE-----------------------
W = stat.glmnet_coefdiff(X, X_k, y, nfolds=10, family="binomial")

## ------------------------------------------------------------------------
thres = knockoff.threshold(W, fdr=0.2, offset=1)

## ------------------------------------------------------------------------
selected = which(W >= thres)
print(selected)

## ------------------------------------------------------------------------
fdp = function(selected) sum(beta[selected] == 0) / max(1, length(selected))
fdp(selected)

## ------------------------------------------------------------------------
# Optimize the parameters needed for generating Gaussian knockoffs, 
# by solving an SDP to minimize correlations with the original variables.
# This calculation requires only the model parameters mu and Sigma, 
# not the observed variables X. Therefore, there is no reason to perform it
# more than once for our simulation.

diag_s = create.solve_asdp(Sigma)

# Compute the fdp over 20 iterations
nIterations = 20
fdp_list = sapply(1:nIterations, function(it) {
    # Run the knockoff filter manually, using the pre-computed value of diag_s
    X_k = create.gaussian(X, mu, Sigma, diag_s=diag_s)
    W = stat.glmnet_lambdasmax(X, X_k, y, family="binomial")
    t = knockoff.threshold(W, fdr=0.2, offset=1)
    selected = which(W >= t)
    # Compute and store the fdp
    fdp(selected)
  })
# Estimate the FDR
mean(fdp_list)

