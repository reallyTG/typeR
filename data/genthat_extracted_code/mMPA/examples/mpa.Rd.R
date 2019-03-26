library(mMPA)


### Name: mpa
### Title: Number of Assays Needed using Mini-Pooling with Algorithm (MPA)
### Aliases: mpa
### Keywords: mMPA.

### ** Examples

K=5; n = 50;
n.pool  = n/K; n.pool
#   [1] 10
set.seed(100)
pvl = rgamma(n, shape = 2.8, scale = 150)
mpa(v = pvl)
#  A total of 10 pools are formed.
#   The numbers of assays required by these pools are:
#   [1] 3 3 4 4 2 5 4 4 4 4




