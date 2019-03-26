library(tsqn)


### Name: robacf
### Title: Robust autocorrelation or autocovariance function estimation
### Aliases: robacf

### ** Examples

data.set <- cbind(fdeaths,mdeaths)
robacf(data.set)
robacf(data.set,type="covariance",lag.max=10)



