library(OpVaR)


### Name: goftest
### Title: Goodness of fit tests for severity distributions
### Aliases: goftest

### ** Examples

data("lossdat")
opriskmodel = list()
opriskmodel[[1]] = list()
opriskmodel[[1]]$freqdist = fitFreqdist(lossdat[[1]],"pois")
opriskmodel[[1]]$sevdist = fitPlain(lossdat[[1]],"gamma")

# perform test on the sevdist object
goftest(lossdat[[1]], opriskmodel[[1]]$sevdist)

# show result for e.g. only the Kolmogorow-Smirnov test
test = goftest(lossdat[[1]], opriskmodel[[1]]$sevdist)
test[[3]]$p.value
test[[3]]$statistic

# perform test on the freqdist object
goftest(lossdat[[1]], opriskmodel[[1]]$freqdist)

# the p-value is given by 
goftest(lossdat[[1]], opriskmodel[[1]]$freqdist)$p.value



