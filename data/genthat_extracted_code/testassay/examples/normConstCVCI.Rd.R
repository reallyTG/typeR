library(testassay)


### Name: normConstCVCI
### Title: Log-centered confidence intervals from a Normal constant
###   coeffficient of variation model
### Aliases: normConstCVCI

### ** Examples

# defaults to 68.27 percent confidence level, same level as Normal plus or minus 1 std dev.
normConstCVCI(3.4,.6)
# symmetric on log scale
log(normConstCVCI(3.4,.6))




