library(baytrends)


### Name: censpp
### Title: Probability Plotting Positions
### Aliases: censpp censpp.default censpp.lcens censpp.mcens censpp.default
###   censpp.lcens censpp.mcens
### Keywords: internal manip

### ** Examples

# This example demonstrates the probability adjustments made for censoring
# The raw, uncensored data:
ppoints(7, .44)
# censor ar 0.5 (the lowest 3 values)
censpp(as.lcens(ppoints(7, .44), 0.5))




