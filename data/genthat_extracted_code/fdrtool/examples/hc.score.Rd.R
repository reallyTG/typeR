library(fdrtool)


### Name: hc.score
### Title: Compute Empirical Higher Criticism Scores and Corresponding
###   Decision Threshold From p-Values
### Aliases: hc.score hc.thresh
### Keywords: htest

### ** Examples

# load "fdrtool" library
library("fdrtool")

# some p-values
data(pvalues)

# compute HC scores
hc.score(pvalues)

# determine HC threshold
hc.thresh(pvalues)



