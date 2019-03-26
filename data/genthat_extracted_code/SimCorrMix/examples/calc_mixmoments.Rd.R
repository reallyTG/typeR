library(SimCorrMix)


### Name: calc_mixmoments
### Title: Find Standardized Cumulants of a Continuous Mixture Distribution
###   by Method of Moments
### Aliases: calc_mixmoments
### Keywords: cumulants mixture

### ** Examples

# Mixture of Normal(-2, 1) and Normal(2, 1)
calc_mixmoments(mix_pis = c(0.4, 0.6), mix_mus = c(-2, 2),
  mix_sigmas = c(1, 1), mix_skews = c(0, 0), mix_skurts = c(0, 0),
  mix_fifths = c(0, 0), mix_sixths = c(0, 0))




