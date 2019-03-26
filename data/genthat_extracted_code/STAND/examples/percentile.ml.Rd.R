library(STAND)


### Name: percentile.ml
### Title: Calculate ML Estimate of Xp and Confidence Limits
### Aliases: percentile.ml
### Keywords: htest optimize

### ** Examples

data(beTWA)
# calculate ML estimate of 95th percentile and CLs for Example 2 in ORNLTM2005-52 
unlist(percentile.ml(beTWA,0.95,0.95))




