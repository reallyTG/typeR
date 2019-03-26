library(tsallisqexp)


### Name: tsal.boot
### Title: Bootstraps methods for Tsallis Distributions
### Aliases: tsal.boot tsal.bootstrap.errors tsal.total.magnitude
### Keywords: distribution

### ** Examples


#####
# (1) fit
x <- rtsal(20, 1/2, 1/4)
tsal.loglik(x, 1/2, 1/4)

tsal.fit(x, method="mle.equation")
tsal.fit(x, method="mle.direct")
tsal.fit(x, method="leastsquares")



		



