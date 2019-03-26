library(MConjoint)


### Name: mc.despack.linear.utils
### Title: mc.despack.linear.utils
### Aliases: mc.despack.linear.utils
### Keywords: multivariate

### ** Examples


data(hire.despack)
data(hire.data)
hire.despack=mc.despack.linear.conjoint(hire.despack,hire.data)
hire.despack=mc.despack.linear.utils(hire.despack)
hire.despack$all.utils[[3]][[2]]




