library(CorrBin)


### Name: trend.test
### Title: Test for increasing trend with correlated binary data
### Aliases: trend.test
### Keywords: htest nonparametric

### ** Examples

data(shelltox)
trend.test(shelltox, test="RS")
set.seed(5724)
#R=50 is too low to get a good estimate of the p-value
trend.test(shelltox, test="RS", R=50, exact=TRUE)



