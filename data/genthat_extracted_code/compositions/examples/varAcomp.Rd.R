library(compositions)


### Name: var.acomp
### Title: Variances and covariances of amounts and compositions
### Aliases: var var.default var.acomp var.rcomp var.aplus var.rplus
###   var.rmult cov cov.default cov.acomp cov.rcomp cov.aplus cov.rplus
###   cov.rmult
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
meanCol(sa.lognormals)
var(acomp(sa.lognormals))
var(rcomp(sa.lognormals))
var(aplus(sa.lognormals))
var(rplus(sa.lognormals))
cov(acomp(sa.lognormals5[,1:3]),acomp(sa.lognormals5[,4:5]))
cov(rcomp(sa.lognormals5[,1:3]),rcomp(sa.lognormals5[,4:5]))
cov(aplus(sa.lognormals5[,1:3]),aplus(sa.lognormals5[,4:5]))
cov(rplus(sa.lognormals5[,1:3]),rplus(sa.lognormals5[,4:5]))
cov(acomp(sa.lognormals5[,1:3]),aplus(sa.lognormals5[,4:5]))

svd(var(acomp(sa.lognormals)))




