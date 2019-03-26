library(BayesTreePrior)


### Name: GetListUniqueSplits
### Title: Unique splits that leads to children with more than minpart
###   nodes.
### Aliases: GetListUniqueSplits

### ** Examples

GetListUniqueSplits(c(1,4,7,3,0,2,2,3,4,7,7,7),minpart=1)
GetListUniqueSplits(c(1,4,7,3,0,2,2,3,4,7,7,7),minpart=3)
GetListUniqueSplits(c(1,4,7,3,0,2,2,3,4,7,7,7,NA,NA,NA),minpart=1, MIA=TRUE)
GetListUniqueSplits(c(1,4,7,3,0,2,2,3,4,7,7,7,NA,NA,NA),minpart=3, MIA=TRUE)



