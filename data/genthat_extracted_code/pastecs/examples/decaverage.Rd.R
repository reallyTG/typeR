library(pastecs)


### Name: decaverage
### Title: Time series decomposition using a moving average
### Aliases: decaverage
### Keywords: ts smooth

### ** Examples

data(marbio)
ClausoB.ts <- ts(log(marbio$ClausocalanusB + 1))
ClausoB.dec <- decaverage(ClausoB.ts, order=2, times=10, sides=2, ends="fill")
plot(ClausoB.dec, col=c(1, 3, 2), xlab="stations")
# A stacked graph is more representative in this case
plot(ClausoB.dec, col=c(1, 3), xlab="stations", stack=FALSE, resid=FALSE,
        lpos=c(53, 4.3))



