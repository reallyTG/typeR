library(sparsenet)


### Name: plot.sparsenet
### Title: plot coefficients from a "sparsenet" object
### Aliases: plot.sparsenet
### Keywords: lasso subset

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fit=sparsenet(x,y)
par(mfrow=c(3,3))
plot(fit)



