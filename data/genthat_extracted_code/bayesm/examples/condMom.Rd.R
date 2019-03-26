library(bayesm)


### Name: condMom
### Title: Computes Conditional Mean/Var of One Element of MVN given All
###   Others
### Aliases: condMom
### Keywords: distribution

### ** Examples

sig  = matrix(c(1, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 1), ncol=3)
sigi = chol2inv(chol(sig))
mu   = c(1,2,3)
x    = c(1,1,1)

condMom(x, mu, sigi, 2)



