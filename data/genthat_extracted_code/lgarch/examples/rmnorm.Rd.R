library(lgarch)


### Name: rmnorm
### Title: Random number generation from the multivariate normal
###   distribution
### Aliases: rmnorm
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##generate from univariate standardised normal:
z1 <- rmnorm(100)

##generate from bivariate, independent standardised normal:
z2 <- rmnorm(100, vcov=diag(c(1,1)))

##generate from bivariate, dependent standardised normal:
z3 <- rmnorm(100, vcov=cbind(c(1,0.3),c(0.3,1)))



