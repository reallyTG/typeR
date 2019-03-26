library(Rfast2)


### Name: Covariance between a variable and a matrix of variables
### Title: Covariance between a variable and a matrix of variables
### Aliases: covar

### ** Examples

y <- rnorm(40)
x <- matrix( rnorm(40 * 10), ncol = 10 )
covar(y, x)
cov(y, x)



