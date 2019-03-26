library(UncertainInterval)


### Name: quality.threshold.uncertain
### Title: Function for the description of the qualities of the Uncertain
###   Interval.
### Aliases: quality.threshold.uncertain

### ** Examples

# A simple test model
ref=c(rep(0,500), rep(1,500))
test=c(rnorm(500,0,1), rnorm(500,1,sd=1))
ua = ui.nonpar(ref, test)
quality.threshold.uncertain(ref, test, ua[1], ua[2])



