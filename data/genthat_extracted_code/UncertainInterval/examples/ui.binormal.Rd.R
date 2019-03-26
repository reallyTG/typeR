library(UncertainInterval)


### Name: ui.binormal
### Title: Function for the determination of the sample thresholds an
###   inconclusive interval for bi-normal distributed test scores.
### Aliases: ui.binormal

### ** Examples

# A simple test model
ref=c(rep(0,500), rep(1,500))
test=c(rnorm(500,0,1), rnorm(500,1,1))
ui.binormal(ref, test)




