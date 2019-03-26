library(equateMultiple)


### Name: EquateMultiple-package
### Title: Equating of Multiple Forms
### Aliases: EquateMultiple-package EquateMultiple
### Keywords: package

### ** Examples

data(est2pl)
# prepare the data
mods <- modIRT(coef = est2pl$coef, var = est2pl$var, display = FALSE)
# Estimation of the equating coefficients with the multiple mean-mean method
eqMM <- multiec(mods = mods, base = 1, method = "mean-mean")
summary(eqMM)

# Estimation of the equating coefficients with the 
# multiple mean-geometric mean method (Haberman, 2009)
eqMGM <- multiec(mods = mods, base = 1, method = "mean-gmean")
summary(eqMGM)

# Estimation of the equating coefficients with the multiple item response function method
eqIRF <- multiec(mods = mods, base = 1, method = "irf")
summary(eqIRF)

# Estimation of the equating coefficients with the multiple item response function method
# using as initial values the estimates obtained with the multiple mean-geometric mean method
eqMGM <- multiec(mods = mods, base = 1, method = "mean-gmean", se = FALSE)
eqIRF <- multiec(mods = mods, base = 1, method = "irf", start = eqMGM)
summary(eqIRF)

# Estimation of the equating coefficients with the multiple test response function method
eqTRF <- multiec(mods = mods, base = 1, method = "trf")
summary(eqTRF)

# scoring using the true score equating method and equating coefficients 
# obtained with the multiple item response function method
score(eqIRF)



