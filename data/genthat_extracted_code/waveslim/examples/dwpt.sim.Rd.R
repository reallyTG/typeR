library(waveslim)


### Name: dwpt.sim
### Title: Simulate Seasonal Persistent Processes Using the DWPT
### Aliases: dwpt.sim
### Keywords: ts

### ** Examples

## Generate monthly time series with annual oscillation
## library(ts) is required in order to access acf()
x <- dwpt.sim(256, "mb16", .4, 1/12, M=4, epsilon=.001)
par(mfrow=c(2,1))
plot(x, type="l", xlab="Time")
acf(x, lag.max=128, ylim=c(-.6,1))
data(acvs.andel8)
lines(acvs.andel8$lag[1:128], acvs.andel8$acf[1:128], col=2)



