library(pastecs)


### Name: decmedian
### Title: Time series decomposition using a running median
### Aliases: decmedian
### Keywords: ts smooth

### ** Examples

data(marbio)
ClausoB.ts <- ts(log(marbio$ClausocalanusB + 1))
ClausoB.dec <- decmedian(ClausoB.ts, order=2, times=10, ends="fill")
plot(ClausoB.dec, col=c(1, 4, 2), xlab="stations")
# This is a transect across a frontal zone:
plot(ClausoB.dec, col=c(0, 2), xlab="stations", stack=FALSE, resid=FALSE)
lines(c(17, 17), c(0, 10), col=4, lty=2)
lines(c(25, 25), c(0, 10), col=4, lty=2)
lines(c(30, 30), c(0, 10), col=4, lty=2)
lines(c(41, 41), c(0, 10), col=4, lty=2)
lines(c(46, 46), c(0, 10), col=4, lty=2)
text(c(8.5, 21, 27.5, 35, 43.5, 57), 8.7, labels=c("Peripheral Zone", "D1",
        "C", "Front", "D2", "Central Zone"))



