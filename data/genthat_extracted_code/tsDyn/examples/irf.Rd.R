library(tsDyn)


### Name: irf
### Title: Impulse response function
### Aliases: irf print.varirf irf.nlVar
### Keywords: regression

### ** Examples

data(barry)

## For VAR
mod_var <- lineVar(barry, lag = 2)
irf(mod_var, impulse = "dolcan", response = c("dolcan", "cpiUSA", "cpiCAN"), boot =
FALSE)

## For VECM
mod_VECM <- VECM(barry, lag = 2, estim="ML", r=2)
irf(mod_VECM, impulse = "dolcan", response = c("dolcan", "cpiUSA", "cpiCAN"), boot =
FALSE)



