library(kedd)


### Name: plot.h.bcv
### Title: Plot for Biased Cross-Validation
### Aliases: plot.h.bcv lines.h.bcv
### Keywords: plot

### ** Examples

## EXAMPLE 1:

plot(h.bcv(trimodal, whichbcv = 1, deriv.order = 0),main="",sub="")
lines(h.bcv(trimodal, whichbcv = 2, deriv.order = 0),col="red")
legend("topright", c("BCV1","BCV2"),lty=1,col=c("black","red"),inset = .015)

## EXAMPLE 2:

plot(h.bcv(trimodal, whichbcv = 1, deriv.order = 1),main="",sub="")
lines(h.bcv(trimodal, whichbcv = 2, deriv.order = 1),col="red")
legend("topright", c("BCV1","BCV2"),lty=1,col=c("black","red"),inset = .015)



