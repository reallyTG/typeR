library(bootLR)


### Name: medianConsistentlyOne
### Title: Find the lowest population probability whose median is
###   consistently one This is the lowest estimate for Sens that is
###   consistently (over 5 runs) most likely to yield a sample estimate
###   that is all 1's (e.g. 100/100, etc.).
### Aliases: medianConsistentlyOne

### ** Examples

## Not run: 
##D prs <- seq(.990,.995,.0001)
##D bools <- sapply( prs, medianConsistentlyOne, size=truePos, R=R )
##D data.frame( prs, bools )
## End(Not run)



