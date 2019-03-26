library(NCmisc)


### Name: dup.pairs
### Title: Obtain an index of all instances of values with duplicates
###   (ordered)
### Aliases: dup.pairs

### ** Examples

set <- c(1,1,2,2,3,4,5,6,2,2,2,2,12,1,3,3,1)
dup.pairs(set) # shows the indexes (ordered) of duplicated values
set[dup.pairs(set)] # shows the values that were duplicated (only 1's, 2's and 3's)



