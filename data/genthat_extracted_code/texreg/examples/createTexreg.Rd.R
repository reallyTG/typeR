library(texreg)


### Name: createTexreg
### Title: Create a texreg object
### Aliases: createTexreg

### ** Examples

library(nlme)  #load library for fitting linear mixed effects models
model <- lme(distance ~ age, data = Orthodont, random = ~ 1)  #estimate model
coefficient.names <- rownames(summary(model)$tTable)  #extract coefficient names
coefficients <- summary(model)$tTable[, 1]  #extract coefficient values
standard.errors <- summary(model)$tTable[, 2]  #extract standard errors
significance <- summary(model)$tTable[, 5]  #extract p values

lik <- summary(model)$logLik  #extract log likelihood
aic <- summary(model)$AIC  #extract AIC
bic <- summary(model)$BIC  #extract BIC
n <- nobs(model)  #extract number of observations
gof <- c(aic, bic, lik, n)  #create a vector of GOF statistics
gof.names <- c("AIC", "BIC", "Log Likelihood", "Num. obs.")  #names of GOFs
decimal.places <- c(TRUE, TRUE, TRUE, FALSE)  #the last one is a count variable

#create the texreg object
tr <- createTexreg(
  coef.names = coefficient.names, 
  coef = coefficients, 
  se = standard.errors, 
  pvalues = significance, 
  gof.names = gof.names, 
  gof = gof, 
  gof.decimal = decimal.places
)



