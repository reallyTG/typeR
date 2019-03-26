library(CRTSize)


### Name: n4props
### Title: Number of Subjects Required for a Cluster Randomized Trial with
###   a Binary Outcome
### Aliases: n4props print.n4props summary.n4props
### Keywords: design

### ** Examples

## Not run: 
##D Suppose a new drug is thought to reduce heart attack mortality from 0.10 to 0.03. 
##D Calculate the required number of subjects that must be enrolled in a study to detect this 
##D difference with alpha = 0.05 and power = 0.80.
## End(Not run)
n4props(pe=0.03, pc=0.10, m=25, ICC=0.20, AR=1, alpha=0.05, power=0.80);



