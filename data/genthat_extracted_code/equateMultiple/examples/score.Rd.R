library(equateMultiple)


### Name: score.mlteqc
### Title: Scoring of multiple forms
### Aliases: score.mlteqc

### ** Examples

data(est2pl)
# prepare the data
mods <- modIRT(coef = est2pl$coef, var = est2pl$var, display = FALSE)

# Estimation of the equating coefficients with the multiple item response function method
eqIRF<-multiec(mods = mods, base = 1, method = "irf")
summary(eqIRF)

# scoring using the true score equating method
score(eqIRF)

# scoring using observed score equating method, without standard errors
score(eqIRF, method = "OSE", se = FALSE)



