library(equateMultiple)


### Name: eqc.mlteqc
### Title: Extract Equating Coefficients of Multiple Forms
### Aliases: eqc.mlteqc

### ** Examples

data(est2pl)
# prepare the data
mods <- modIRT(coef = est2pl$coef, var = est2pl$var, display = FALSE)
# Estimation of the equating coefficients with the multiple item response function method
eqIRF <- multiec(mods = mods, base = 1, method = "irf")

# extract equating coefficients
eqc(eqIRF)



