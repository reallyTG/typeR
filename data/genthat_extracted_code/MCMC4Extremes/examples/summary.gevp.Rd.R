library(MCMC4Extremes)


### Name: summary.gevp
### Title: Summarizing Posterior Distribution with Parameters of GEV
### Aliases: summary.gevp

### ** Examples

# Return level of river nidd data
data(nidd.annual)
out=gevp(nidd.annual,1,300)
a=summary(out)
a



