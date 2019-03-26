library(STAND)


### Name: percentile.ple
### Title: Calculate Nonparametric Estimate of Xp and Confidence Limits
### Aliases: percentile.ple
### Keywords: htest nonparametric

### ** Examples

# use data from example 2 in ORNL/TM-2005/52 to calculate
# 95 percent UCL for 95th percentile
data(beTWA) 
unlist(percentile.ple(beTWA))
unlist(percentile.ml(beTWA)) # compare ML estimates



