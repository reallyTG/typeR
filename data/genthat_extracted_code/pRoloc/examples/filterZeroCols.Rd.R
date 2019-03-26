library(pRoloc)


### Name: filterZeroCols
### Title: Remove 0 columns/rows
### Aliases: filterZeroCols filterZeroRows

### ** Examples

library("pRolocdata")
data(andy2011goCC)
any(colSums(exprs(andy2011goCC)) == 0)
exprs(andy2011goCC)[, 1:5] <- 0
ncol(andy2011goCC)
ncol(filterZeroCols(andy2011goCC))



