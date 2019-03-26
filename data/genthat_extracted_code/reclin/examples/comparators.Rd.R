library(reclin)


### Name: identical
### Title: Comparison functions
### Aliases: identical jaro_winkler lcs jaccard

### ** Examples

cmp <- identical()
x <- cmp(c("john", "mary", "susan", "jack"), 
         c("johan", "mary", "susanna", NA))
# Applying the comparison function to the result of the comparison results 
# in a logical result, with NA's and values of FALSE set to FALSE
cmp(x)

cmp <- jaro_winkler(0.95)
x <- cmp(c("john", "mary", "susan", "jack"), 
         c("johan", "mary", "susanna", NA))
# Applying the comparison function to the result of the comparison results 
# in a logical result, with NA's and values below the threshold FALSE
cmp(x)

## Don't show: 
gc()
## End(Don't show)




