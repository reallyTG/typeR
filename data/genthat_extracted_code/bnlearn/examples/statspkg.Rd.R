library(bnlearn)


### Name: lm integration
### Title: Produce lm objects from Bayesian networks
### Aliases: 'lm integration' as.lm as.lm.bn as.lm.bn.fit
###   as.lm.bn.fit.gnode
### Keywords: interfaces to other packages

### ** Examples

dag = hc(gaussian.test)
fitted = bn.fit(dag, gaussian.test)
as.lm(dag, gaussian.test)
as.lm(fitted, gaussian.test)
as.lm(fitted$F, gaussian.test)



