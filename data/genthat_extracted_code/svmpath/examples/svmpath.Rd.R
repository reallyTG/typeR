library(svmpath)


### Name: svmpath
### Title: Fit the entire regularization path for a 2-class SVM
### Aliases: svmpath
### Keywords: regression

### ** Examples

data(svmpath)
attach(unbalanced.separated)
svmpath(x,y,trace=TRUE,plot=TRUE)
detach(2)
## Not run: svmpath(x,y,kernel=radial.kernel,param.kernel=.8)



