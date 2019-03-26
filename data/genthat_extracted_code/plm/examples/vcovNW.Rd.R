library(plm)


### Name: vcovNW
### Title: Newey and West (1987) Robust Covariance Matrix Estimator
### Aliases: vcovNW vcovNW.plm vcovNW.pcce
### Keywords: regression

### ** Examples

library(lmtest)
library(car)
data("Produc", package="plm")
zz <- plm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc, model="pooling")
## standard coefficient significance test
coeftest(zz)
## NW robust significance test, default
coeftest(zz, vcov.=vcovNW)
## idem with parameters, pass vcov as a function argument
coeftest(zz, vcov.=function(x) vcovNW(x, type="HC1", maxlag=4))
## joint restriction test
waldtest(zz, update(zz, .~.-log(emp)-unemp), vcov=vcovNW)
## test of hyp.: 2*log(pc)=log(emp)
linearHypothesis(zz, "2*log(pc)=log(emp)", vcov.=vcovNW)



