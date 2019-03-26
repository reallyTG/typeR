library(svmpath)


### Name: summary.svmpath
### Title: produce a summary of an svmpath object
### Aliases: summary.svmpath
### Keywords: regression

### ** Examples

data(svmpath)
attach(balanced.overlap)
fit <- svmpath(x,y,trace=TRUE,plot=TRUE)
summary(fit)
detach(2)



