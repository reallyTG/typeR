library(pastecs)


### Name: AutoD2
### Title: AutoD2, CrossD2 or CenterD2 analysis of a multiple time-series
### Aliases: AutoD2 CrossD2 CenterD2
### Keywords: ts multivariate htest

### ** Examples

data(marphy)
marphy.ts <- as.ts(as.matrix(marphy[, 1:3]))
AutoD2(marphy.ts)
marphy.ts2 <- as.ts(as.matrix(marphy[, c(1, 4, 3)]))
CrossD2(marphy.ts, marphy.ts2)
# This is not identical to:
CrossD2(marphy.ts2, marphy.ts)
marphy.d2 <- CenterD2(marphy.ts, window=16)
lines(c(17, 17), c(-1, 15), col=4, lty=2)
lines(c(25, 25), c(-1, 15), col=4, lty=2)
lines(c(30, 30), c(-1, 15), col=4, lty=2)
lines(c(41, 41), c(-1, 15), col=4, lty=2)
lines(c(46, 46), c(-1, 15), col=4, lty=2)
text(c(8.5, 21, 27.5, 35, 43.5, 57), 11, labels=c("Peripheral Zone", "D1",
        "C", "Front", "D2", "Central Zone")) # Labels
time(marphy.ts)[marphy.d2$D2 > marphy.d2$chisq]



