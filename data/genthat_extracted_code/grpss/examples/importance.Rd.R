library(grpss)


### Name: importance
### Title: Arrange and visualize the importance of groups
### Aliases: importance

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

crivalues <- grp.criValues(X,y,group)  # gSIS
importance(crivalues, n = 20)



