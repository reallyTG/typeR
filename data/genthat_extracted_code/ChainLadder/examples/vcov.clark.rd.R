library(ChainLadder)


### Name: vcov.clark
### Title: Covariance Matrix of Parameter Estimates - Clark's methods
### Aliases: vcov.clark

### ** Examples


x <- GenIns
colnames(x) <- 12*as.numeric(colnames(x))
Y <- ClarkCapeCod(x, Premium=10000000+400000*0:9, maxage=240)
round(vcov(Y),6) ## Compare to matrix on p. 69 of Clark's paper

# The estimates of the loglogistic parameters
Y$THETAG
# The standard errors of the estimated parameters
sqrt(tail(diag(vcov(Y)), 2))

# The parameter risks of the estimated reserves are calculated 
# according to the formula on p. 54 of Clark's paper. For example, for
# the 5th accident year, pre- and post-multiply the covariance matrix
# by a matrix consisting of the gradient entries for just that accident year
FVgrad5 <- matrix(Y$FutureValueGradient[, 5], ncol=1)
sqrt(t(FVgrad5) %*% vcov(Y) %*% FVgrad5) ## compares to 314,829 in Clark's paper

# The estimated reserves for accident year 5:
Y$FutureValue[5]   ## compares to 2,046,646 in the paper

# Recalculate the parameter risk CV for all accident years in total (10.6% in paper):
sqrt(sum(t(Y$FutureValueGradient) %*% vcov(Y) %*% Y$FutureValueGradient)) / 
    Y$Total$FutureValue




