library(TopKLists)


### Name: aggmap
### Title: Aggregation map for the integration of truncated lists
### Aliases: aggmap

### ** Examples

set.seed(1234)
data(breast)
truncated.lists = calculate.maxK(breast, d=10, v=10, L=3, threshold=50)
## Not run: 
##D aggmap(truncated.lists)
## End(Not run)



