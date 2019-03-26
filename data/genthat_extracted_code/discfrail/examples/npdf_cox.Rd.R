library(discfrail)


### Name: npdf_cox
### Title: Cox model for grouped survival data with nonparametric discrete
###   shared frailties
### Aliases: npdf_cox

### ** Examples

test <- npdf_cox( Surv(time, status) ~ x, groups=family, data=weibdata2030, K = 4, eps_conv=10^-4)
test    # optimal model (by all criteria) has 2 latent populations
test$models[[1]] # examine alternative model with 1 latent population




