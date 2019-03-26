library(RSEIS)


### Name: PSTLTcurve
### Title: Short Term/Long Term curve
### Aliases: PSTLTcurve
### Keywords: misc hplot

### ** Examples


require(stats)

data(CE1)
plot(CE1$x, CE1$y, type='l')

z <- CE1$y[ CE1$x>5.352622 & CE1$x<5.589836]
x <- CE1$x[ CE1$x>5.352622 & CE1$x<5.589836]

G <- PSTLTcurve(z, dt = CE1$dt, fwlen = 10,
bwlen = 10, perc = 0.05,
stretch = 10, MED = 11, PLOT = FALSE)

### get time from beginning of trace
tpick <- x[G$ind]
abline(v=x[G$ind], col='red', lty=2)





