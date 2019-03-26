library(sparsenet)


### Name: plot.cv.sparsenet
### Title: plot the cross-validation curves produced by cv.sparsenet
### Aliases: plot.cv.sparsenet
### Keywords: lasso subset

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fitcv=cv.sparsenet(x,y)
plot(fitcv)



