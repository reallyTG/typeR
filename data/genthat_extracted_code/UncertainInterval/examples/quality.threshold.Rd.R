library(UncertainInterval)


### Name: quality.threshold
### Title: Function for the description of the qualities of one or two
###   decision thresholds or threshold.
### Aliases: quality.threshold

### ** Examples

# A simple test
ref=c(rep(0,500), rep(1,500))
test=c(rnorm(500,0,1), rnorm(500,1,1))
ua = ui.nonpar(ref, test)
quality.threshold(ref, test, threshold=ua[1], threshold.upper=ua[2])



