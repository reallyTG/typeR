library(plm)


### Name: vcovSCC
### Title: Driscoll and Kraay (1998) Robust Covariance Matrix Estimator
### Aliases: vcovSCC vcovSCC.plm vcovSCC.pcce
### Keywords: regression

### ** Examples

library(lmtest)
library(car)
data("Produc", package="plm")
zz <- plm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc, model="pooling")
## standard coefficient significance test
coeftest(zz)
## SCC robust significance test, default
coeftest(zz, vcov.=vcovSCC)
## idem with parameters, pass vcov as a function argument
coeftest(zz, vcov.=function(x) vcovSCC(x, type="HC1", maxlag=4))
## joint restriction test
waldtest(zz, update(zz, .~.-log(emp)-unemp), vcov=vcovSCC)
## test of hyp.: 2*log(pc)=log(emp)
linearHypothesis(zz, "2*log(pc)=log(emp)", vcov.=vcovSCC)



