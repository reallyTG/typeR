library(AICcmodavg)


### Name: AICcCustom
### Title: Custom Computation of AIC, AICc, QAIC, and QAICc from
###   User-supplied Input
### Aliases: AICcCustom
### Keywords: models

### ** Examples

##cement data from Burnham and Anderson (2002, p. 101)
data(cement)
##run multiple regression - the global model in Table 3.2
glob.mod <- lm(y ~ x1 + x2 + x3 + x4, data = cement)

##extract log-likelihood
LL <- logLik(glob.mod)[1]

##extract number of parameters
K.mod <- coef(glob.mod) + 1

##compute AICc with full likelihood
AICcCustom(LL, K.mod, nobs = nrow(cement))



