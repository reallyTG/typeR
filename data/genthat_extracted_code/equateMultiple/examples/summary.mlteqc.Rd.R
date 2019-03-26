library(equateMultiple)


### Name: summary.mlteqc
### Title: Summarizing Estimated Equating Coefficients
### Aliases: summary.mlteqc

### ** Examples

data(est2pl)
# prepare the data
mods <- modIRT(coef = est2pl$coef, var = est2pl$var, display = FALSE)
# Estimation of the equating coefficients with the multiple mean-mean method
eqMM <- multiec(mods = mods, base = 1, method = "mean-mean")
summary(eqMM)



