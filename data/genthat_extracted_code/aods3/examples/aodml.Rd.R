library(aods3)


### Name: aodml
### Title: ML Estimation of Generalized Linear Models for Overdispersed
###   Count Data
### Aliases: aodml print.aodml summary.aodml print.summary.aodml
###   anova.aodml print.anova.aodml fitted.aodml residuals.aodml coef.aodml
###   logLik.aodml deviance.aodml df.residual.aodml AIC.aodml vcov.aodml
###   predict.aodml
### Keywords: regression

### ** Examples


#------ Beta-binomial model

data(orob2)
fm1 <- aodml(cbind(m, n - m) ~ seed, data = orob2, family = "bb")

# summaries
fm1
summary(fm1)
coef(fm1)
vcov(fm1)
logLik(fm1)
deviance(fm1)
AIC(fm1)
gof(fm1)

# predictions
cbind(
  fitted(fm1),
  fitted(fm1, what = "nu"),
  fitted(fm1, what = "eta"),
  fitted(fm1, what = "phi")
)
predict(fm1, type = "response", se.fit = TRUE)
newdat <- data.frame(seed = c("O73", "O75"))
predict(fm1, type = "response", se.fit = TRUE, newdata = newdat)

# model with heterogeneity in phi
fm <- aodml(cbind(m, n - m) ~ seed, data = orob2,
  family = "bb", phi.formula = ~ seed)
summary(fm)
AIC(fm1, fm)

# various phi scales
fm <- aodml(cbind(m, n - m) ~ seed, data = orob2, family = "bb")
fm$phi
fm$phi.scale
fm <- aodml(cbind(m, n - m) ~ seed, data = orob2, family = "bb",
            phi.scale = "log")
fm$phi
fm$phi.scale
fm <- aodml(cbind(m, n - m) ~ seed, data = orob2, family = "bb",
            phi.scale = "inverse")
fm$phi
fm$phi.scale

### Models with coefficient(s) set as constant

# model with 1 phi coefficient, set as constant "0.02"
fm <- aodml(formula = cbind(m, n - m) ~ seed * root, data = orob2,
  family = "bb", fixpar = list(5, 0.02))
fm$param
fm$varparam

# model with 2 phi coefficients, with the first set as constant ~ "0"
fm <- aodml(formula = cbind(m, n - m) ~ seed * root, data = orob2,
  family = "bb", phi.formula = ~ seed, fixpar = list(5, 1e-15))
fm$param
fm$varparam

# model with 2 phi coefficients, with the first set as constant ~ "0",
# and the mu intercept (1rst coef of vector b) set as as constant "-0.5"
fm <- aodml(formula = cbind(m, n - m) ~ seed * root, data = orob2,
            family = "bb", phi.formula = ~ seed,
            fixpar = list(c(1, 5), c(-0.5, 1e-15)))
fm$param
fm$varparam
  
### Model tests

# LR tests - non-constant phi
fm0 <- aodml(cbind(m, n - m) ~ 1, data = orob2, family = "bb")
fm2 <- aodml(cbind(m, n - m) ~ seed + root, data = orob2, family = "bb")
fm3 <- aodml(cbind(m, n - m) ~ seed * root, data = orob2, family = "bb")
anova(fm0, fm1, fm2, fm3)

# LR tests - constant phi
# phi is assumed to be estimated from fm3
fm2.bis <- aodml(cbind(m, n - m) ~ seed  + root, data = orob2,
                 family = "bb", fixpar = list(4, fm3$phi))
LRstat <- 2 * (logLik(fm3) - logLik(fm2.bis))  
pchisq(LRstat, df = 1, lower.tail = FALSE)  
  
# Wald test of the seed factor in fm1
wald.test(b = coef(fm3), varb = vcov(fm3), Terms = 4)

#------ Negative binomial model

### Modelling counts

data(salmonella)
fm1 <- aodml(m ~ log(dose + 10) + dose, data = salmonella, family = "nb")
## fm1 <- aodml(m ~ log(dose + 10) + dose, data = salmonella, family = "nb",
##              method = "Nelder-Mead")

# summaries
fm1
summary(fm1)
coef(fm1)
vcov(fm1)
logLik(fm1)
deviance(fm1)
AIC(fm1)
gof(fm1)

# predictions
cbind(
  fitted(fm1),
  fitted(fm1, what = "nu"),
  fitted(fm1, what = "eta"),
  fitted(fm1, what = "phi")
)
predict(fm1, type = "response", se.fit = TRUE)
newdat <- data.frame(dose = c(20, 40))
predict(fm1, type = "response", se.fit = TRUE, newdata = newdat)

# various phi scales
fm <- aodml(m ~ log(dose + 10) + dose, data = salmonella, family = "nb")
fm$phi
fm$phi.scale
fm <- aodml(m ~ log(dose + 10) + dose, data = salmonella,
            family = "nb", phi.scale = "log")
fm$phi
fm$phi.scale
fm <- aodml(m ~ log(dose + 10) + dose, data = salmonella,
            family = "nb", phi.scale = "inverse")
fm$phi
fm$phi.scale
  
# LR and Wald tests of the "log(dose + 10) + dose" factors
fm0 <- aodml(m ~ 1, data = salmonella, family = "nb")
anova(fm0, fm1)
fm0.bis <- aodml(m ~ 1, data = salmonella, family = "nb",
                 fixpar = list(2, fm1$phi))
LRstat <- 2 * (logLik(fm1) - logLik(fm0.bis))  
pchisq(LRstat, df = 2, lower.tail = FALSE)  
wald.test(b = coef(fm1), varb = vcov(fm1), Terms = 2:3)

### Modelling a rate
  
data(dja)
# rate "m / trisk"
fm <- aodml(formula = m ~ group + offset(log(trisk)),
            data = dja, family = "nb")
summary(fm)

fm <- aodml(formula = m ~ group + offset(log(trisk)),
            phi.formula = ~ group, data = dja, family = "nb",
            phi.scale = "log")
summary(fm)
  
# model with 1 phi coefficient, set as constant "0.8"
fm <- aodml(formula = m ~ group + offset(log(trisk)), data = dja,
            family = "nb", phi.formula = ~1, fixpar = list(3, 0.8))
fm$param
fm$varparam

# model with 2 phi coefficients, with the first set as constant ~ "0" in the identity scale
fm <- aodml(formula = m ~ group + offset(log(trisk)), data = dja,
            family = "nb", phi.formula = ~ group, phi.scale = "log",
            fixpar = list(4, -15))
fm$param
fm$varparam

# model with 2 phi coefficients, with the first set as constant "0" in the identity scale,
# and the mu intercept coefficient (1rst coef of vector b) set as as constant "-0.5"
fm <- aodml(formula = m ~ group + offset(log(trisk)), data = dja,
  family = "nb", phi.formula = ~ group, phi.scale = "log",
  fixpar = list(c(1, 4), c(-0.5, -15)))
fm$param
fm$varparam



