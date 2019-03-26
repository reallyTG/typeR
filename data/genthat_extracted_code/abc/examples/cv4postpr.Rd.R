library(abc)


### Name: cv4postpr
### Title: Leave-one-our cross validation for model selection ABC
### Aliases: cv4postpr
### Keywords: models htest

### ** Examples

require(abc.data)
data(human)
###Reduce the sample size of the simulations to reduce the running time.
###Do not do that with your own data!
ss<-c(1:1000,50001:51000,100001:101000)
cv.modsel <- cv4postpr(models[ss], stat.3pops.sim[ss,], nval=5, tols=c(.05,.1), method="rejection") 
summary(cv.modsel)
plot(cv.modsel, names.arg=c("Bottleneck", "Constant", "Exponential"))



