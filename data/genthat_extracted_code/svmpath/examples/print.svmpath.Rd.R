library(svmpath)


### Name: print.svmpath
### Title: Print a summary of the SVM path
### Aliases: print.svmpath
### Keywords: regression

### ** Examples

data(svmpath)
attach(balanced.overlap)
fit <- svmpath(x,y,trace=TRUE,plot=TRUE)
print(fit)
detach(2)



