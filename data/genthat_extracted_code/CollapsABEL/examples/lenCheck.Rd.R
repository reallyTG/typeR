library(CollapsABEL)


### Name: lenCheck
### Title: Check each element of a list has expected length Give a 'list(a,
###   b, ...)' and 'vector(l1, l2, ...)', check that length of a is equal
###   to l1, length of b is equal to l2, etc.
### Aliases: lenCheck

### ** Examples

## Not run: 
##D lenCheck(list(1, 2, 3), c(1, 1, 0))
##D grepl("\\nGiven: \n.*", lenCheck(list(1, 2, 3), c(1, 1, 0)))
##D grepl("\\nGiven: \n.*", lenCheck(list(1, c(1, 2, 3), list(4, 5, 6)), c(1, 1, 0))) 
##D lenCheck(list(1, c(1, 2, 3), list(4, 5, 6)), c(1, 3, 3))
## End(Not run)




