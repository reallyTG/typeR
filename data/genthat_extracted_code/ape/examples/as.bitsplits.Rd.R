library(ape)


### Name: as.bitsplits
### Title: Split Frequencies and Conversion Among Split Classes
### Aliases: as.bitsplits as.bitsplits.prop.part print.bitsplits
###   sort.bitsplits bitsplits countBipartitions as.prop.part
###   as.prop.part.bitsplits
### Keywords: manip

### ** Examples

tr <- rtree(20)
pp <- prop.part(tr)
as.bitsplits(pp)
## doesn't work for rooted trees...:
countBipartitions(rtree(10), rmtree(100, 10))
## ... but OK with unrooted trees:
countBipartitions(rtree(10, rooted = FALSE), rmtree(100, 10, rooted = FALSE))



