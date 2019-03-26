library(synchrony)


### Name: phase.partnered
### Title: Phase partnered time series
### Aliases: phase.partnered

### ** Examples

# Positively cross-correlated white noise
pos.corr=phase.partnered(n = 100, rho = 0.7, gamma = 0)
# Negatively cross-correlated white noise
neg.corr=phase.partnered(n = 100, rho = -1, gamma = 0)
par(mfrow=c(2,1))
matplot (pos.corr$timeseries, t="l", lty=1)
matplot (neg.corr$timeseries, t="l", lty=1)



