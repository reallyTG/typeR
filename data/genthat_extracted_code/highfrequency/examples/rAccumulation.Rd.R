library(highfrequency)


### Name: rAccumulation
### Title: Realized Accumulation Plot
### Aliases: rAccumulation
### Keywords: methods

### ** Examples

data(sbux.xts)

cumm <- list() 
cumm[[1]] <- rCumSum(sbux.xts, period=1, align.by="seconds", align.period=60) 
cumm[[2]] <- rCumSum(sbux.xts, period=10, align.by="seconds", align.period=60) 
cumm[[3]] <- rCumSum(sbux.xts, period=20, align.by="seconds", align.period=60) 
cumm[[4]] <- rCumSum(sbux.xts, period=30, align.by="seconds", align.period=60) 
accum <- list() 
accum[[1]] <- rAccumulation(sbux.xts, period=10, align.by="seconds", align.period=60) 
accum[[2]] <- rAccumulation(sbux.xts, period=20, align.by="seconds", align.period=60) 
accum[[3]] <- rAccumulation(sbux.xts, period=30, align.by="seconds", align.period=60)

par(mfrow=c(2,1)) 
plot(cumm[[1]], xlab="", ylab="Cumulative Ruturns", main="Starbucks (SBUX)",
     sub='20110701', type="p", col=16, lwd=2) 
lines(cumm[[2]], col=2, lwd=2) 
lines(cumm[[3]], col=3, lwd=2) 
lines(cumm[[4]], col=4, lwd=2) 
plot(accum[[1]], xlab="", ylab="Realized Accumulation", type="l",main="Starbucks (SBUX)", 
      sub='20110701', col=2, lwd=2) 
lines(accum[[2]], col=3, lwd=2) 
lines(accum[[3]], col=4, lwd=2) 



