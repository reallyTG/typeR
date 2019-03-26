library(hhh4contacts)


### Name: aggregateCountsArray
### Title: Aggregate an Array of Counts wrt One Dimension (Stratum)
### Aliases: aggregateCountsArray
### Keywords: manip

### ** Examples

## works for matrices
aggregateCountsArray(pop2011, dim = 2, grouping = c(2,1,3,2,4))
aggregateCountsArray(pop2011, dim = 1, grouping = list(
    "a" = c("chwi","span","zehl"),
    "b" = c("neuk","scho")
))
## and of course for arrays
str(aggregateCountsArray(counts, dim = 3, grouping = c(1, 3, 4)))



