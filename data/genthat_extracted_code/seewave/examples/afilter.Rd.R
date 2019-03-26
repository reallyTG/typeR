library(seewave)


### Name: afilter
### Title: Amplitude filter
### Aliases: afilter
### Keywords: ts filter

### ** Examples

data(orni)
op<-par(mfrow=c(2,1))
afilter(orni,f=22050)
title(main = "threshold level = 5")
afilter(orni,f=22050,threshold=0.5,colwave="blue")
title(main = "threshold level = 0.5")
par(op)



