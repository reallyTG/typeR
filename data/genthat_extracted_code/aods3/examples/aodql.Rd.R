library(aods3)


### Name: aodql
### Title: QL/MM Estimation of Generalized Linear Models for Overdispersed
###   Count Data
### Aliases: aodql anova.aodql coef.aodql deviance.aodql df.residual.aodql
###   fitted.aodql logLik.aodql predict.aodql print.aodql residuals.aodql
###   summary.aodql vcov.aodql
### Keywords: regression

### ** Examples


#------ Binomial-type models

data(orob2)
fm <- aodql(cbind(m, n - m) ~ seed, data = orob2, family = "qbin")
coef(fm)
vcov(fm)
summary(fm)
# chi2 tests of the seed factor in fm
wald.test(b = coef(fm), varb = vcov(fm), Terms = 2)

# chi-2 vs. deviance statistic to estimate phi
fm1 <- aodql(cbind(m, n - m) ~ seed + root, data = orob2, family = "qbin")
fm2 <- aodql(cbind(m, n - m) ~ seed + root, data = orob2, family = "qbin", method = "dev")
coef(fm1)
coef(fm2)
fm1$phi
fm2$phi
vcov(fm1)
vcov(fm2)
gof(fm1)
gof(fm2)

# estimate with fixed phi
fm <- aodql(cbind(m, n - m) ~ seed, data = orob2, family = "qbin", phi = 0.05)
coef(fm)
vcov(fm)
summary(fm)

#------ Poisson-type models

data(salmonella)
fm <- aodql(m ~ log(dose + 10) + dose, data = salmonella, family = "qpois")
coef(fm)
vcov(fm)
summary(fm)
# chi2 tests of the "log(dose + 10) + dose" factors
wald.test(b = coef(fm), varb = vcov(fm), Terms = 2:3)

# chi-2 vs. deviance statistic to estimate phi
fm1 <- aodql(m ~ log(dose + 10) + dose, data = salmonella, family = "qpois")
fm2 <- aodql(m ~ log(dose + 10) + dose, data = salmonella, family = "qpois", method = "dev")
coef(fm1)
coef(fm2)
fm1$phi
fm2$phi
vcov(fm1)
vcov(fm2)
gof(fm1)
gof(fm2)

# estimate with fixed phi
fm <- aodql(m ~ log(dose + 10) + dose, data = salmonella, family = "qpois", phi = 0.05)
coef(fm)
vcov(fm)
summary(fm)

# modelling a rate
data(dja)
# rate "m / trisk"
fm <- aodql(formula = m ~ group + offset(log(trisk)), data = dja, family = "qpois")
summary(fm)




