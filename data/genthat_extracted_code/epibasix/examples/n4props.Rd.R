library(epibasix)


### Name: n4props
### Title: Number of Subjects Required for a Randomized Trial with Binary
###   Outcomes
### Aliases: n4props print.n4props summary.n4props
### Keywords: design

### ** Examples

## Not run: 
##D Suppose a new drug is thought to reduce heart attack mortality from 
##D 0.10 to 0.03. Calculate the required number of subjects that must be enrolled 
##D in a study to detect this difference with alpha = 0.05 and power = 0.80.
## End(Not run)
n4props(0.03, 0.10, AR=1, alpha=0.05, power=0.80);



