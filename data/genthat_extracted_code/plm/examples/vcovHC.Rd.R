library(plm)


### Name: vcovHC
### Title: Robust Covariance Matrix Estimators
### Aliases: vcovHC vcovHC.plm vcovHC.pgmm vcovHC.pcce pvcovHC
### Keywords: regression

### ** Examples

library(lmtest)
library(car)
data("Produc", package = "plm")
zz <- plm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,
          data = Produc, model = "random")
## standard coefficient significance test
coeftest(zz)
## robust significance test, cluster by group
## (robust vs. serial correlation)
coeftest(zz, vcov.=vcovHC)
## idem with parameters, pass vcov as a function argument
coeftest(zz, vcov.=function(x) vcovHC(x, method="arellano", type="HC1"))
## idem, cluster by time period
## (robust vs. cross-sectional correlation)
coeftest(zz, vcov.=function(x) vcovHC(x, method="arellano",
 type="HC1", cluster="group"))
## idem with parameters, pass vcov as a matrix argument
coeftest(zz, vcov.=vcovHC(zz, method="arellano", type="HC1"))
## joint restriction test
waldtest(zz, update(zz, .~.-log(emp)-unemp), vcov=vcovHC)
## test of hyp.: 2*log(pc)=log(emp)
linearHypothesis(zz, "2*log(pc)=log(emp)", vcov.=vcovHC)

## Robust inference for GMM models
data("EmplUK", package="plm")
ar <- pgmm(dynformula(log(emp) ~ log(wage) + log(capital) + log(output),
           list(2, 1, 2, 2)), data = EmplUK, effect = "twoways",
           model = "twosteps", gmm.inst = ~ log(emp),
           lag.gmm = list(c(2, 99)))
rv <- vcovHC(ar)
mtest(ar, order = 2, vcov = rv)




