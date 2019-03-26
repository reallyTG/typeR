library(ic.infer)


### Name: contr.diff
### Title: Contrast function for factors with ordered values that yields
###   increment coefficients
### Aliases: contr.diff
### Keywords: multivariate optimize

### ** Examples

## mu, Sigma and covariance matrix
means <- c(3,5,2,7)
## contrast matrix
contr.diff(4)
## design matrix
X <- cbind(rep(1,4),contr.diff(4))
## estimated coefficients
solve(t(X)%*%X,t(X)%*%means)



