library(lbiassurv)


### Name: lbsample
### Title: Generates gength bias samples from a parametric family.
### Aliases: lbsample
### Keywords: Length bias sampling

### ** Examples

mydata=lbsample(500,family="exponential",par=list(rate=1))
hist(mydata$time)



