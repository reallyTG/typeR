library(splus2R)


### Name: rmvnorm
### Title: Multivariate Normal (Gaussian) Distribution
### Aliases: rmvnorm
### Keywords: utilities

### ** Examples

## 5 rows and 2 independent columns 
rmvnorm(5)

## 5 rows and 3 independent columns 
rmvnorm(5, mean=c(9,3,1))

## 2 columns, std. dev. 1, correlation .9 
rmvnorm(5, rho=.9)

## specify variable means and covariance matrix 
rmvnorm(5, mean=c(9,3), cov=matrix(c(4,1,1,2), 2))



