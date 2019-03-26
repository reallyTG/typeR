library(tsallisqexp)


### Name: tsal.test
### Title: Test Tsallis Distributions
### Aliases: tsal.test test.tsal.quantile.transform
###   test.tsal.LR.distribution
### Keywords: distribution

### ** Examples


#####
# (1) fit
x <- rtsal(20, 1/2, 1/4)
tsal.loglik(x, 1/2, 1/4)

tsal.fit(x, method="mle.equation")
tsal.fit(x, method="mle.direct")
tsal.fit(x, method="leastsquares")



		



