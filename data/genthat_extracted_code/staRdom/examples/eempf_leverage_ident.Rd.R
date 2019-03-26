library(staRdom)


### Name: eempf_leverage_ident
### Title: Plot leverage of emission wavelengths, excitation wavelengths
###   and samples.
### Aliases: eempf_leverage_ident

### ** Examples

data(pfres_comps1)

leverage <- eempf_leverage(pfres_comps[[2]])
outliers <- eempf_leverage_ident(leverage)



