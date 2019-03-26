library(StatPerMeCo)


### Name: StatPerMeas
### Title: Statistical performance measures to evaluate conditional
###   covariance matrix estimates.
### Aliases: StatPerMeas
### Keywords: Statistical Performance Measure Stein loss function Mean
###   Square Error Mean Absolute Error Eigenvalue loss function Euclidean
###   distance Frobenius distance Elw loss function Asymmetric loss
###   function

### ** Examples

X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

StatPerMeas(S,H,measure="ALL",b=10)

StatPerMeas(S,H,measure=c("MSE","MAE","Ls"),b=4)




