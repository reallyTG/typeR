library(ruv)


### Name: variance_adjust
### Title: Adjust Estimated Variances
### Aliases: variance_adjust

### ** Examples

## Create some simulated data
m = 50
n = 10000
nc = 1000
p = 1
k = 20
ctl = rep(FALSE, n)
ctl[1:nc] = TRUE
X = matrix(c(rep(0,floor(m/2)), rep(1,ceiling(m/2))), m, p)
beta = matrix(rnorm(p*n), p, n)
beta[,ctl] = 0
W = matrix(rnorm(m*k),m,k)
alpha = matrix(rnorm(k*n),k,n)
epsilon = matrix(rnorm(m*n),m,n)
Y = X%*%beta + W%*%alpha + epsilon

## Run RUV-inv
fit = RUVinv(Y, X, ctl)

## Get adjusted variances and p-values
fit = variance_adjust(fit)



