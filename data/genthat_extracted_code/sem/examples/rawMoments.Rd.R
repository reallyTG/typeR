library(sem)


### Name: rawMoments
### Title: Compute Raw Moments Matrix
### Aliases: rawMoments rawMoments.formula rawMoments.default cov2raw
###   print.rawmoments
### Keywords: manip

### ** Examples

# the following are all equivalent (with the exception of the name of the intercept):

rawMoments(cbind(1, Kmenta))

rawMoments(~ Q + P + D + F + A, data=Kmenta)

Cov <- with(Kmenta, cov(cbind(Q, P, D, F, A)))
cov2raw(Cov, colMeans(Kmenta), nrow(Kmenta))



