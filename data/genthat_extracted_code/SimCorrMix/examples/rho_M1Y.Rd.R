library(SimCorrMix)


### Name: rho_M1Y
### Title: Approximate Correlation between Continuous Mixture Variable M1
###   and Random Variable Y
### Aliases: rho_M1Y
### Keywords: correlation mixture

### ** Examples

# M1 is mixture of N(-2, 1) and N(2, 1); pairwise correlation set to 0.35
rho_M1Y(mix_pis = c(0.4, 0.6), mix_mus = c(-2, 2), mix_sigmas = c(1, 1),
  p_M1Y = c(0.35, 0.35))




