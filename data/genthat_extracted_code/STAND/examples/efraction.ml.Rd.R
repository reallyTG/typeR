library(STAND)


### Name: efraction.ml
### Title: Calculate ML Estimate of Exceedance Fraction and Confidence
###   Limits
### Aliases: efraction.ml
### Keywords: htest

### ** Examples

# calculate ML estimate of exceedance fraction and CLs for Example 2 in ORNLTM2005-52 
data(beTWA)
unlist(efraction.ml(beTWA,L=0.2))
#  calculate nonparametric CLs 
unlist(efclnp(beTWA,L=0.2))



