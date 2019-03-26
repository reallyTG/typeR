library(AICcmodavg)


### Name: useBICCustom
### Title: Custom Computation of BIC and QBIC from User-supplied Input
### Aliases: useBICCustom
### Keywords: models

### ** Examples

##cement data from Burnham and Anderson (2002, p. 101)
data(cement)
##run multiple regression - the global model in Table 3.2
glob.mod <- lm(y ~ x1 + x2 + x3 + x4, data = cement)

##extract log-likelihood
LL <- logLik(glob.mod)[1]

##extract number of parameters
##including residual variance
K.mod <- length(coef(glob.mod)) + 1

##compute BIC with full likelihood
useBICCustom(LL, K.mod, nobs = nrow(cement))
##compare against useBIC
useBIC(glob.mod)



