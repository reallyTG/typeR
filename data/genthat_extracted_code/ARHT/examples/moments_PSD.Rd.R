library(ARHT)


### Name: moments_PSD
### Title: Consistent estimators of high-order moments of the population
###   spectral distribution for high-dimensional data
### Aliases: moments_PSD
### Keywords: estimators moments population spectral

### ** Examples

set.seed(10086)
n = 400; p= 500
pop_eig = seq(10,1,length = p)
# Data with covariance matrix diag(pop_eig)
Z = matrix(rnorm(n*p),n,p)
X = Z %*% diag(sqrt(pop_eig))
raw_eig = svd(cov(X))$d
emp_eig = raw_eig[raw_eig>=0]
# Moments of population spectral distribution
colMeans(outer(pop_eig, 1:4, "^"))
# Estimators
moments_PSD(emp_eig, n-1, 4)



