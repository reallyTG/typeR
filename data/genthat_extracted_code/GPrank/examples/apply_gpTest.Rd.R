library(GPrank)


### Name: apply_gpTest
### Title: Performing Gaussian process test
### Aliases: apply_gpTest
### Keywords: Bayes factor model,

### ** Examples

x=as.matrix(seq(1,10))
y=as.matrix(sin(x))
v=as.matrix(runif(10,0,0.5))
nullModelKernelTypes=c("white","fixedvariance")
modelKernelTypes=c("rbf","white","fixedvariance")
test_result=apply_gpTest(x,y,v,nullModelKernelTypes,modelKernelTypes,y_fitted=TRUE)
null_model=test_result$nullModel
model=test_result$model
logBF=test_result$logBF
y_fitted=test_result$y_fitted




