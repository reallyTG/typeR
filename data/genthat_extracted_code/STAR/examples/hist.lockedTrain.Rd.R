library(STAR)


### Name: hist.lockedTrain
### Title: Auto- and Cross-Intensity Function Estimate for Spike Trains
### Aliases: plot.hist.lockedTrain hist.lockedTrain
### Keywords: ts survival

### ** Examples

## Reproduce Fig. 6 of Ogata 1988
data(ShallowShocks)
shalShocks <- lockedTrain(as.spikeTrain(ShallowShocks$Date),,c(0,500))
shalShocksH <- hist(shalShocks,5,plot=FALSE)
plot(shalShocksH,"Ogata",c(0.95,0.99),xlab="TIME LAG (DAYS)",ylab="NUMBER OF EVENTS PER DAY")
## Reproduce Fig. 7 of Ogata 1988
myBinNb <- 101
myMidPoints <- seq(from = 1, to = 6, length.out=myBinNb)
myMidPoints <- 10^myMidPoints/200
myBreaks <- c(0,myMidPoints[-myBinNb] + diff(myMidPoints) / 2)
shalShocksH2 <- hist(shalShocks,breaks=myBreaks,plot=FALSE)
yy <- abs(shalShocksH2$density - shalShocksH2$refFreq)
plot(shalShocksH2$mids[shalShocksH2$density>0],
     yy[shalShocksH2$density>0],
     pch = 1,
     xlim = c(0.001,10000),
     log = "xy",
     xlab = "TIME LAG (DAYS)",
     ylab = "NUMBER OF EVENTS PER DAY"
     )




