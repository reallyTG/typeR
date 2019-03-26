library(TSA)


### Name: plot.armasubsets
### Title: Plot the Best Subset ARMA models
### Aliases: plot.armasubsets
### Keywords: methods

### ** Examples

set.seed(53331)
test=arima.sim(model=list(ar=c(rep(0,11),.8),ma=c(rep(0,11),0.7)),n=120)
res=armasubsets(y=test,nar=14,nma=14,y.name='test',ar.method='ols')
plot(res)



