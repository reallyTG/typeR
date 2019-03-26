library(plm)


### Name: vcovDC
### Title: Double-Clustering Robust Covariance Matrix Estimator
### Aliases: vcovDC vcovDC.plm vcovDC.pcce
### Keywords: regression

### ** Examples

library(lmtest)
library(car)
data("Produc", package="plm")
zz <- plm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc, model="pooling")
## standard coefficient significance test
coeftest(zz)
## DC robust significance test, default
coeftest(zz, vcov.=vcovDC)
## idem with parameters, pass vcov as a function argument
coeftest(zz, vcov.=function(x) vcovDC(x, type="HC1", maxlag=4))
## joint restriction test
waldtest(zz, update(zz, .~.-log(emp)-unemp), vcov=vcovDC)
## test of hyp.: 2*log(pc)=log(emp)
linearHypothesis(zz, "2*log(pc)=log(emp)", vcov.=vcovDC)



