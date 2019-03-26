library(tsallisqexp)


### Name: tsal.fit
### Title: Fitting Tsallis Distributions
### Aliases: tsal.loglik tsal.fisher tsal.fit
### Keywords: distribution

### ** Examples


#####
# (1) fit
x <- rtsal(20, 1/2, 1/4)
tsal.loglik(x, 1/2, 1/4)

tsal.fit(x, method="mle.equation")
tsal.fit(x, method="mle.direct")
tsal.fit(x, method="leastsquares")



		



