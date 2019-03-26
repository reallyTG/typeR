library(bfp)


### Name: rmvt
### Title: Multivariate Student Random Deviates
### Aliases: rmvt
### Keywords: distribution internal

### ** Examples

## samples from the multivariate Cauchy distribution:
bfp:::rmvt(20)

## here the covariance exists:
sigma <- matrix(c(1, 0.5, 0.5, 1), nrow=2)
df <- 10

## theoretical covariance:
sigma * df / (df - 2)

## this should be close:
cov(bfp:::rmvt(n=100000, sigma=sigma, df=df))



