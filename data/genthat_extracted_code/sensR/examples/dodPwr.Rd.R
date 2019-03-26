library(sensR)


### Name: dodPwr
### Title: Power of the Degree-of-Difference (DOD) method
### Aliases: dodPwr
### Keywords: models

### ** Examples


## NOTE: The number of simulations (nsim) is set unrealistically low in
## the examples below to reduce the computation time for automatic
## package checks. nsim between 1e3 and 1e4 is usually sufficient and
## the latter often on the safe side. The standard error of the
## estimated power ('se(power)') reported by dodPwr() measures the
## accuracy of the estimated power and indicates if nsim needs to be
## increased.

## Estimate power of the conventional difference test (no-difference
## under the null hypothesis):
set.seed(125)
dodPwr(d.primeA=1, d.prime0=0, ncat=4, sample.size=100, nsim=50,
       alpha=.05, method.tau="LR.max", statistic="likelihood")
##  [1] 0.62
##  attr(,"se(power)")
##  [1] 0.1825346
##  attr(,"n.used")
##  [1] 50
## Here the boundary parameters are chosen automatically so as to
## maximize the likelihood ratio test statistic, and so this setting
## amounts to a highest achievable power scenario given d-prime = 1.

## Using another (and faster) statistic:
dodPwr(d.primeA=1, d.prime0=0, ncat=4, sample.size=100, nsim=1e3,
       alpha=.05, method.tau="LR.max", statistic="Wilcox")

## Not run: 
##D ## Not automatically run to reduce computation time.
##D 
##D ## Power of a similarity test:
##D set.seed(127)
##D dodPwr(d.primeA=0, d.prime0=1, ncat=4, sample.size=100, nsim=1e2,
##D        alpha=.05, method.tau="LR.max", statistic="Pearson",
##D        alternative="similarity")
##D ##  [1] 0.71
##D ##  attr(,"se(power)")
##D ##  [1] 0.1434922
##D ##  attr(,"n.used")
##D ##  [1] 100
##D 
##D ## Same as above, but with a given set of boundary parameters:
##D dodPwr(d.primeA=0, d.prime0=1, sample.size=100, nsim=1e2,
##D        alpha=.05, method.tau="user.defined", statistic="Pearson",
##D        alternative="similarity", tau=1:3)
##D 
##D ## Using parallel computing to speed up computations:
##D if(require(parallel)) {
##D     ## Use detectCores() to get an appropriate number of cores for
##D     ## practical use - for the example here we fix it at 2:
##D     ## cl <- makeCluster(detectCores())
##D     cl <- makeCluster(getOption("cl.cores", 2))
##D     dvec <- c(0, .2, .5, .7, 1, 1.2, 1.5, 1.75)
##D     system.time(
##D         res <- parLapply(cl, dvec, fun=function(dp) {
##D             library(sensR)
##D             x <- dodPwr(dp, 0, sample.size=100, nsim=1e4, stat="Wil")
##D             c("power"=x, "se"=attr(x, "se(power)"))
##D         })
##D         )
##D     stopCluster(cl)
##D     names(res) <- dvec
##D     mat <- do.call(cbind, res)
##D     round(mat[1:2, ], 3)
##D     ## Example output:
##D     ##            0   0.2   0.5   0.7     1   1.5  1.75     2
##D     ##  power 0.051 0.058 0.123 0.238 0.578 0.983 1.000 1.000
##D     ##  se    0.022 0.023 0.033 0.043 0.049 0.013 0.002 0.001
##D }
## End(Not run)
## Realistically one should use more simulations, e.g. nsim=1e4.

## Don't show: 
## set.seed(1)
## a <- dodSim(sample.size = 10, replicates = 3, d.prime = 2,
##            method = "triangle", sd.indiv = 1)
## expect <- c(3L, 3L, 2L, 3L, 3L, 1L, 3L, 3L, 1L, 2L)
## stopifnot(all(a == expect))
## 
## End(Don't show)



