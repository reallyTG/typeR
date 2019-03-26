library(NPHazardRate)


### Name: SemiparamEst
### Title: Discrete hazard rate estimator
### Aliases: SemiparamEst

### ** Examples

options(echo=FALSE)
xin<-c(7,34,42,63,64, 74, 83, 84, 91, 108, 112,129, 133,133,139,140,140,146,
      149,154,157,160,160,165,173,176,185, 218,225,241, 248,273,277,279,297,
      319,405,417,420,440, 523,523,583, 594, 1101, 1116, 1146, 1226, 1349,
      1412, 1417) #head and neck data set
cens<-c(1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
        1,0,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1) #censoring indicators
xin<-xin/30.438 #mean adjust the data
storage.mode(xin)<-"integer"  # turn the data to integers
xout<-seq(1,47, by=1) #design points where to calculate the estimate
arg<-TutzPritscher(xin,cens,xout) #Kernel smooth estimate
plot(xout, arg, type="l", ylim=c(0, .35), lty=2,  col=6)
argSM<-SemiparamEst(xin, cens, xout, "geometric", "uniform",
                    "geometric", 0.2, .6, 0, 90, .25, .9) #semipar. est.
lines(xout, argSM[,2], lty=3, col=5) #add tilde lambda to the plot



