library(fracdiff)


### Name: fracdiff
### Title: ML Estimates for Fractionally-Differenced ARIMA (p,d,q) models
### Aliases: fracdiff
### Keywords: ts

### ** Examples

ts.test <- fracdiff.sim( 5000, ar = .2, ma = -.4, d = .3)
fd. <- fracdiff( ts.test$series,
                 nar = length(ts.test$ar), nma = length(ts.test$ma))
fd.
## Confidence intervals
confint(fd.)

## with iteration output
fd2 <- fracdiff(ts.test$series, nar = 1, nma = 1, trace = 1)
all.equal(fd., fd2)



