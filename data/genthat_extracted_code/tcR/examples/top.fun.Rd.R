library(tcR)


### Name: top.fun
### Title: Get samples from a repertoire slice-by-slice or top-by-top and
###   apply function to them.
### Aliases: top.fun slice_fun

### ** Examples

## Not run: 
##D # Get entropy of V-usage for the first 1000, 2000, 3000, ... clones.
##D res <- top.fun(immdata[[1]], 1000, entropy.seg)
##D # Get entropy of V-usage for the interval of clones with indices [1,1000], [1001,2000], ...
##D res <- top.fun(immdata[[1]], 1000, entropy.seg)
## End(Not run)



