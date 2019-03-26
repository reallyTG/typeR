library(distrMod)


### Name: Estimate-class
### Title: Estimate-class.
### Aliases: Estimate-class name,Estimate-method name<-,Estimate-method
###   estimate estimate,Estimate-method estimate.call
###   estimate.call,Estimate-method Infos Infos,Estimate-method samplesize
###   samplesize,Estimate-method completecases
###   completecases,Estimate-method asvar asvar,Estimate-method
###   fixed,Estimate-method asvar<- asvar<-,Estimate-method
###   nuisance,Estimate-method main,Estimate-method Infos<-
###   Infos<-,Estimate-method addInfo<- addInfo<-,Estimate-method
###   show,Estimate-method print,Estimate-method untransformed.estimate
###   untransformed.estimate,Estimate-method untransformed.asvar
###   untransformed.asvar,Estimate-method
### Keywords: classes

### ** Examples

x <- rnorm(100)
Estimator(x, estimator = mean, name = "mean")

x1 <- x; x1[sample(1:100,10)] <- NA
myEst1 <- Estimator(x1, estimator = mean, name = "mean")
samplesize(myEst1)
samplesize(myEst1, onlycomplete = FALSE)



