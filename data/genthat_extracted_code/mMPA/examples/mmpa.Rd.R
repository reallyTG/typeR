library(mMPA)


### Name: mmpa
### Title: Number of Assays Required using Marker-Assisted Mini-Pooling
###   with Algorithm (mMPA)
### Aliases: mmpa
### Keywords: mMPA.

### ** Examples

K=5; n = 50;
n.pool  = n/K; n.pool
#   [1] 10
set.seed(100)
pvl = rgamma(n, shape = 2.8, scale = 150)
riskscore = (rank(pvl)/n) * 0.5 + runif(n) * 0.5
mmpa(v = pvl, s = riskscore)
#   A total of 10 pools are formed.
#   The numbers of assays required by these pools are:
#   [1] 3 3 4 4 2 3 3 4 3 3




