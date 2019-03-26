library(TTR)


### Name: stoch
### Title: Stochastic Oscillator / Stochastic Momentum Index
### Aliases: stoch stochastics stochastic SMI %K %D SMI
### Keywords: ts

### ** Examples


data(ttrc)
stochOSC <- stoch(ttrc[,c("High","Low","Close")])
stochWPR <- WPR(ttrc[,c("High","Low","Close")])

plot(tail(stochOSC[,"fastK"], 100), type="l",
    main="Fast %K and Williams %R", ylab="",
    ylim=range(cbind(stochOSC, stochWPR), na.rm=TRUE) )
lines(tail(stochWPR, 100), col="blue")
lines(tail(1-stochWPR, 100), col="red", lty="dashed")

stoch2MA <- stoch( ttrc[,c("High","Low","Close")],
    maType=list(list(SMA), list(EMA, wilder=TRUE), list(SMA)) )

SMI3MA <- SMI(ttrc[,c("High","Low","Close")],
    maType=list(list(SMA), list(EMA, wilder=TRUE), list(SMA)) )

stochRSI <- stoch( RSI(ttrc[,"Close"]) )



