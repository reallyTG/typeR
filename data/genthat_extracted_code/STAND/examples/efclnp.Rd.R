library(STAND)


### Name: efclnp
### Title: Nonparametric Confidence Limits for the Exceedance Fraction
### Aliases: efclnp
### Keywords: nonparametric htest

### ** Examples

#   calculate nonparametric estimate 
#   for Example 2 in ORNLTM2005 
data(beTWA)
unlist(efclnp(beTWA,L=0.2))
# calculate ML estimates of exceedance fraction and CLs 
unlist(efraction.ml(beTWA,L=0.2))



