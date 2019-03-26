library(tsDyn)


### Name: VARrep
### Title: VAR representation
### Aliases: VARrep VARrep.VECM VARrep.VAR
### Keywords: VAR VECM cointegration ts

### ** Examples



data(barry)

# VECM model:
mod_vecm <- VECM(barry, lag=2, estim="ML")
VARrep(mod_vecm)

# VAR model:
mod_var <- lineVar(barry, lag=2, I="diff")
VARrep(mod_var)





