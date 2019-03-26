library(mMPA)


### Name: pooling_mc
### Title: Monte Carlo Simulation for Estimating the Number of Assays
###   Required when Using Pooled Testing
### Aliases: pooling_mc
### Keywords: Pooling.

### ** Examples

### sample size = 300
n = 300;
set.seed(100)
pvl = rgamma(n, shape = 2.8, scale = 150)
summary(pvl)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#   53      225      392     424    564    1373
riskscore = (rank(pvl)/n) * 0.5 + runif(n) * 0.5
cor(pvl, riskscore, method = "spearman")
#   [1] 0.69
### Pool size K is set to 5
K=5;
### so, the number of pools = 60
n.pool  = n/K; n.pool
#   [1] 60
foo = pooling_mc(pvl, riskscore, perm_num = 100)
### Average number of assays needed per pool for each of the 100
### permutations of the data
apply(foo, 2, mean)
#   [1] 3.43 3.33 3.35 3.47 3.37 3.33 3.37 3.27 3.43 3.28 3.32 3.35 3.35 3.37
#   [15] 3.38 3.37 3.30 3.43 3.28 3.38 3.42 3.35 3.35 3.48 3.30 3.47 3.40 3.35
#  [29] 3.25 3.30 3.38 3.43 3.25 3.45 3.35 3.33 3.42 3.38 3.40 3.33 3.32 3.38
#   [43] 3.33 3.37 3.37 3.33 3.35 3.38 3.38 3.30 3.30 3.33 3.37 3.32 3.30 3.40
#   [57] 3.37 3.42 3.30 3.37 3.38 3.32 3.45 3.38 3.37 3.50 3.33 3.40 3.28 3.37
#   [71] 3.23 3.33 3.23 3.42 3.32 3.32 3.45 3.35 3.32 3.32 3.33 3.33 3.30 3.38
#   [85] 3.37 3.33 3.33 3.20 3.37 3.33 3.30 3.40 3.40 3.32 3.33 3.37 3.40 3.38
#   [99] 3.30 3.33
### Estimated average number of assays needed per pool
mean(foo)
#   3.35
### Estimated average number of assays needed per individual
mean(foo)/K
#   [1] 0.67



