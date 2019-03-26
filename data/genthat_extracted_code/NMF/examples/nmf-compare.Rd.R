library(NMF)


### Name: compare-NMF
### Title: Comparing Results from Different NMF Runs
### Aliases: compare,list-method compare-NMF compare,NMFfit-method
###   consensusmap,list-method consensusmap,NMF.rank-method
###   plot,NMFList,missing-method summary,NMFList-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# compare,NMFfit-method
#----------
x <- rmatrix(20,10)
res <- nmf(x, 3)
res2 <- nmf(x, 2, 'lee')

# compare arguments
compare(res, res2, target=x)

#----------
# compare,list-method
#----------
# compare elements of a list
compare(list(res, res2), target=x)



