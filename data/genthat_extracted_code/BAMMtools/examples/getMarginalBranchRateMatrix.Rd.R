library(BAMMtools)


### Name: getMarginalBranchRateMatrix
### Title: Compute mean branch rates for 'bammdata' object
### Aliases: getMarginalBranchRateMatrix
### Keywords: models

### ** Examples

data(whales)
data(events.whales)
ed <- getEventData(whales, events.whales, nsamples = 10)
mbr <- getMarginalBranchRateMatrix(ed)
dim(mbr$lambda_branch_matrix)



