library(mgcv)


### Name: formXtViX
### Title: Form component of GAMM covariance matrix
### Aliases: formXtViX
### Keywords: models smooth regression

### ** Examples

require(mgcv)
library(nlme)
data(ergoStool)
b <- lme(effort ~ Type, data=ergoStool, random=~1|Subject)
V1 <- extract.lme.cov(b, ergoStool)
V2 <- extract.lme.cov2(b, ergoStool)
X <- model.matrix(b, data=ergoStool)
crossprod(formXtViX(V2, X))
t(X)



