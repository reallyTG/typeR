library(compositions)


### Name: norm
### Title: Vector space norm
### Aliases: norm.default norm.acomp norm.aplus norm.rcomp norm.rplus
###   norm.rmult
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
tmp <- acomp(sa.lognormals)
mvar(tmp)
sum(norm( tmp - mean(tmp) )^2)/(nrow(tmp)-1)




