library(highfrequency)


### Name: rScatterReturns
### Title: Scatterplot of aligned returns
### Aliases: rScatterReturns
### Keywords: methods

### ** Examples

data(sbux.xts)
data(lltc.xts)
par(mfrow=c(2,1))
rScatterReturns(sbux.xts,y=lltc.xts, period=1, align.period=20,
    ylab="LLTC",xlab="SBUX",numbers=FALSE) 
rScatterReturns(sbux.xts,y=lltc.xts, period=1, align.period=20,
   ylab="LLTC",xlab="SBUX",numbers=TRUE) 



