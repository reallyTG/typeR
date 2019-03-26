library(TSA)


### Name: armasubsets
### Title: Selection of Subset ARMA Models
### Aliases: armasubsets
### Keywords: methods

### ** Examples

set.seed(92397)
test=arima.sim(model=list(ar=c(rep(0,11),.8),ma=c(rep(0,11),0.7)),n=120)
res=armasubsets(y=test,nar=14,nma=14,y.name='test',ar.method='ols')
plot(res)



