library(sparsenet)


### Name: sparsenet-package
### Title: Fit a linear model regularized by the nonconvex MC+ sparsity
###   penalty
### Aliases: sparsenet-package
### Keywords: regression package sparse

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fit=sparsenet(x,y)
plot(fit)
cvfit=cv.sparsenet(x,y)
plot(cvfit)



