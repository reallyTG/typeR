library(mMPA)


### Name: minipool
### Title: Number of Assays Needed using Mini-Pooling
### Aliases: minipool
### Keywords: mini-pooling.

### ** Examples

K=5; n = 50;
n.pool  = n/K; n.pool
#  [1] 10
set.seed(100)
pvl = rgamma(n, shape = 2.8, scale = 150)
minipool(pvl)
#  A total of 10 pools are formed.
#  The numbers of assays required by these pools are:
#  [1] 6 6 6 6 6 6 6 6 6 6




