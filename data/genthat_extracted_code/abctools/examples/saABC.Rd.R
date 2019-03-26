library(abctools)


### Name: saABC
### Title: Summary statistic construction by semi-automatic ABC
### Aliases: saABC

### ** Examples

set.seed(1)
theta <- matrix(runif(2E3),ncol=2)
colnames(theta) <- c("Mean", "Variance")

X <- replicate(5, rnorm(1E3, theta[,1], theta[,2]))

saABC(theta, X)$BICs
saABC(theta, cbind(X, X^2))$BICs ##Variance parameter estimated better 



