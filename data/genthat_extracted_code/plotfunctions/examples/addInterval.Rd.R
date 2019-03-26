library(plotfunctions)


### Name: addInterval
### Title: Draw intervals or arrows on plots.
### Aliases: addInterval

### ** Examples

emptyPlot(1000,5, xlab='Time', ylab='Y')
# add interval indication for Time=200 to Time=750:
addInterval(1, 200, 750, lwd=2, col='red')

# zero-length intervals also should work:
addInterval(pos=521, lowVals=c(1.35, 1.5, 4.33), highVals=c(1.15,1.5, 4.05),
    horiz=FALSE, length=.1, lwd=4)

# combine with getCoords for consistent positions with different axes:
par(mfrow=c(2,2))
# 1st plot:
emptyPlot(1000,c(-1,5), h0=0)
addInterval(getCoords(.1,side=2), 200,800, 
    col='red', lwd=2)
addInterval(getCoords(.5,side=1), 1,4, horiz=FALSE,
    col='blue', length=.15, angle=100, lwd=4)
abline(h=getCoords(.1, side=2), lty=3, col='red', xpd=TRUE)
abline(v=getCoords(.5, side=1), lty=3, col='blue', xpd=TRUE)
# 2nd plot:
emptyPlot(1000,c(-250, 120), h0=0)
addInterval(getCoords(.1,side=2), 750,1200, 
    col='red', lwd=2, minmax=c(0,1000))
abline(h=getCoords(.1, side=2), lty=3, col='red', xpd=TRUE)
# 3rd plot:
emptyPlot(c(-50,50),c(20,120), h0=0)
addInterval(getCoords(.5,side=1), 80,120, horiz=FALSE,
    col='blue', code=2, length=.15, lwd=4, lend=1)
abline(v=getCoords(.5, side=1), lty=3, col='blue', xpd=TRUE)

# Alternative boxplots: 
b <- boxplot(count ~ spray, data = InsectSprays, plot=FALSE)$stats
emptyPlot(c(1,6), range(b[c(1,5),]), h0=0)
addInterval(1:6, b[1,], b[5,], horiz=FALSE)
# no end lines:
addInterval(1:6, b[2,], b[4,], horiz=FALSE, lwd=8, length=0, lend=2)
# no error with zero-length intervals:
addInterval(1:6, b[3,], b[3,], horiz=FALSE, lwd=2, length=.1, lend=2)

# reset
par(mfrow=c(1,1))



