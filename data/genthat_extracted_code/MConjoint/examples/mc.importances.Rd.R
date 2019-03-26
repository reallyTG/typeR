library(MConjoint)


### Name: mc.importances
### Title: mc.importances
### Aliases: mc.importances
### Keywords: multivariate

### ** Examples


data(hire.despack)
data(hire.data)
hire.despack=mc.despack.linear.conjoint(hire.despack,hire.data)
hire.despack=mc.despack.linear.utils(hire.despack)
hire.despack=mc.importances(hire.despack)
hire.despack$all.imps[12]



