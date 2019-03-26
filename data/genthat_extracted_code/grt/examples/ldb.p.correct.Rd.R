library(grt)


### Name: ldb.p.correct
### Title: Probability of correct classification based on the optimal
###   linear decision bound.
### Aliases: ldb.p.correct
### Keywords: multivariate

### ** Examples

foo <- grtMeans(diag(c(625,625)), centroid=c(200, 200*.6), 
    optldb=c(.6,-1,0), p.correct=.85)
ldb.p.correct(foo$means, foo$covs)



