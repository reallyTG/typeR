## ---- results='hide', message=FALSE, warning=FALSE-----------------------
set.seed(1234)
library(MFKnockoffs)

## ------------------------------------------------------------------------
# Problem parameters
n = 1000         # number of observations
p = 1000         # number of variables
k = 60           # number of variables with nonzero coefficients
amplitude = 7.5  # signal amplitude (for noise level = 1)

# Generate the variables from a multivariate normal distribution
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)

# Generate the response from a logistic model and encode it as a factor.
nonzero = sample(p, k)
beta = amplitude * (1:p %in% nonzero) / sqrt(n)
invlogit = function(x) exp(x) / (1+exp(x))
y.sample = function(x) rbinom(n, prob=invlogit(x %*% beta), size=1)
y = factor(y.sample(X), levels=c(0,1), labels=c("A","B"))

## ------------------------------------------------------------------------
X_k = MFKnockoffs.create.gaussian(X, mu, Sigma)

## ---- results='hide', message=FALSE, warning=FALSE-----------------------
W = MFKnockoffs.stat.glmnet_coef_difference(X, X_k, y, nfolds=10, family="binomial")

## ------------------------------------------------------------------------
thres = MFKnockoffs.threshold(W, q=0.15, method='knockoff+')

## ------------------------------------------------------------------------
selected = which(W >= thres)
print(selected)

## ------------------------------------------------------------------------
fdp = function(selected) sum(beta[selected] == 0) / max(1, length(selected))
fdp(selected)

## ------------------------------------------------------------------------
# Optimize the parameters needed for generating Gaussian knockoffs, 
# by solving as SDP to minimize correlations with the original variables.
# This calculation requires only the model parameters mu and Sigma, 
# not the observed variables X. Therefore, there is no reason to perform it
# more than once for our simulation.

diag_s = MFKnockoffs.knocks.solve_sdp(Sigma)

# Compute the fdp over 20 iterations
nIterations = 20
fdp_list = sapply(1:nIterations, function(it) {
    # Run the knockoff filter manually, using the pre-computed value of diag_s
    X_k = MFKnockoffs.create.gaussian(X, mu, Sigma, diag_s=diag_s)
    W = MFKnockoffs.stat.glmnet_lambda_signed_max(X, X_k, y, family="binomial")
    t = MFKnockoffs.threshold(W, q=0.15, method='knockoff+')
    selected = which(W >= t)
    # Compute and store the fdp
    fdp(selected)
  })
# Estimate the FDR
mean(fdp_list)

