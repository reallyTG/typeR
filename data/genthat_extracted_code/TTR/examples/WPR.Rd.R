library(TTR)


### Name: WPR
### Title: William's %R
### Aliases: WPR
### Keywords: ts

### ** Examples


data(ttrc)
stochOsc <- stoch(ttrc[,c("High","Low","Close")])
stochWPR<- WPR(ttrc[,c("High","Low","Close")])

plot(tail(stochOsc[,"fastK"], 100), type="l",
    main="Fast %K and Williams %R", ylab="",
    ylim=range(cbind(stochOsc, stochWPR), na.rm=TRUE) )
lines(tail(stochWPR, 100), col="blue")
lines(tail(1-stochWPR, 100), col="red", lty="dashed")




