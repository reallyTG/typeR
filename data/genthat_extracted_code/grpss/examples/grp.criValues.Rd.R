library(grpss)


### Name: grp.criValues
### Title: Compute group screening criterion values
### Aliases: grp.criValues

### ** Examples

library(MASS)
n <- 30 # sample size
p <- 3  # number of predictors in each group
J <- 50 # number of groups
group <- rep(1:J,each = 3)  # group indices
Sigma <- diag(p*J)  # covariance matrix
X <- mvrnorm(n,seq(0,5,length.out = p*J),Sigma)
beta <- runif(12,-2,5)  # coefficients
y <- X%*%matrix(c(beta,rep(0,p*J-12)),ncol = 1) + rnorm(n)

grp.criValues(X,y,group)  # gSIS
grp.criValues(X,y,group,"gHOLP")  # gHOLP
grp.criValues(X,y,group,"gAR2")   # gAR2
grp.criValues(X,y,group,"gDC")    # gDC



