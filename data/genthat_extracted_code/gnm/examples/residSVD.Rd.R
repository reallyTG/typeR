library(gnm)


### Name: residSVD
### Title: Multiplicative Approximation of Model Residuals
### Aliases: residSVD
### Keywords: models regression nonlinear

### ** Examples

set.seed(1)

##  Goodman RC1  association model fits well (deviance 3.57, df 8)
mentalHealth$MHS <- C(mentalHealth$MHS, treatment)
mentalHealth$SES <- C(mentalHealth$SES, treatment)
## independence model
indep <- gnm(count ~ SES + MHS, family = poisson, data = mentalHealth)
mult1 <- residSVD(indep, SES, MHS)
## Now use mult1 as starting values for the RC1 association parameters
RC1model <- update(indep, . ~ . + Mult(SES, MHS),
                   start = c(coef(indep), mult1), trace = TRUE)
##  Similarly for the RC2 model:
mult2 <- residSVD(indep, SES, MHS, d = 2)
RC2model <- update(indep, . ~ . + instances(Mult(SES, MHS), 2),
                   start = c(coef(indep), mult2), trace = TRUE)
##
## See also example(House2001), where good starting values matter much more!
##



