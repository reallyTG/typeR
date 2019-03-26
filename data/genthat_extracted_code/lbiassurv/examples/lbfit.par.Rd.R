library(lbiassurv)


### Name: lbfit.par
### Title: Fits parametric models
### Aliases: lbfit.par
### Keywords: length biased sampling survival curve estimation

### ** Examples

mydata=lbsample(500,family="exponential",par=list(rate=1))
lbfit.par(time=mydata$time,censor=mydata$censor,family="exponential",initial=list(shape=3,rate=3))



