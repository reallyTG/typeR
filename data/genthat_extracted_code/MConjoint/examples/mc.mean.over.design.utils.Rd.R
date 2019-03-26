library(MConjoint)


### Name: mc.mean.over.design.utils
### Title: mean over design functions
### Aliases: mc.mean.over.design.utils mc.mean.over.design.imps
### Keywords: multivariate

### ** Examples

data(hire.despack)
data(hire.data)
hire.despack=mc.despack.linear.conjoint(hire.despack,hire.data)
hire.despack=mc.despack.linear.utils(hire.despack)
hire.despack=mc.importances(hire.despack)

mc.mean.over.design.utils(hire.despack$all.utils)
mc.mean.over.design.imps(hire.despack$all.imps)






