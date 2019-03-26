library(bipartite)


### Name: nestedrank
### Title: Calculates the rank of a species in a matrix sorted for maximum
###   nestedness
### Aliases: nestedrank
### Keywords: package

### ** Examples

## Not run: 
##D ranks <- sapply(c("nodf", "binmatnest", "wine", "sort"), function(x) 
##D   nestedrank(Safariland, method=x)[[2]])
##D cor(ranks) # high correlation between sort and other indicate that only abundance matters
## End(Not run)



