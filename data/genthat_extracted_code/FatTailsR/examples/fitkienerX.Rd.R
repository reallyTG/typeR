library(FatTailsR)


### Name: fitkienerX
### Title: Estimation and Regression Functions for Kiener Distributions
### Aliases: fitkienerX paramkienerX paramkienerX7 paramkienerX5

### ** Examples

    

require(minpack.lm)
require(timeSeries)

### Load the datasets and choose j in 1:16
DS     <- getDSdata()
j      <- 5

### and run this block
probak <- c(0.01, 0.05, 0.95, 0.99)
X      <- DS[[j]] ; names(DS)[j]
elevenprobs(X)
fitkienerX(X, algo = "reg", dgts = 3, probak = probak)
fitkienerX(X, algo = "estim", ord = 5, probak = probak, dgts = 3)
paramkienerX(X)
paramkienerX5(X)

### Compare the 12 values of paramkienerX(ord/row = 1:12) and paramkienerX (row 13)
compare <- function(ord, X) { paramkienerX(X, ord, algo = "estim", dgts = 13) }
rbind(t(sapply( 1:12, compare, X)), paramkienerX(X, algo = "reg", dgts = 13))

### Analyze DS in one step
t(sapply(DS, paramkienerX, algo = "reg", dgts = 13))
t(sapply(DS, paramkienerX, algo = "estim", dgts = 13))
paramkienerX(DS, algo = "reg", dgts = 13)
paramkienerX(DS, algo = "estim", dgts = 13)
system.time(fitk_rDS <- fitkienerX(DS, algo = "r", probak = pprobs2, dgts = 3))
system.time(fitk_eDS <- fitkienerX(DS, algo = "e", probak = pprobs2, dgts = 3))
fitk_rDS
fitk_eDS

### Subset rDS and eDS with exfit0,..,exfit7
fitk_rDS[,exfit4]
fitk_eDS[,exfit7]
fitkienerX(DS, algo = "e", probak = pprobs2, dgts = 3, exfitk = exfit7)

### Array (new example introduced in v1.5-1)
### Increase the number of cores and crash R.
## Not run:
arr <- array(rkiener1(3000), c(4,3,250))
paramkienerX7(arr, ncores = 2)
## paramkienerX7(arr, ncores = 2) - paramkienerX(arr, ncores = 2)
## End(Not run)

### End





