library(svmpath)


### Name: plot.svmpath
### Title: plot the svm solution at a step along the path
### Aliases: plot.svmpath
### Keywords: regression

### ** Examples

data(svmpath)
attach(balanced.overlap)
fit <- svmpath(x,y,trace=TRUE,plot=FALSE)
plot(fit,step=2)
detach(2)



