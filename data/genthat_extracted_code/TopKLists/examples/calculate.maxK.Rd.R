library(TopKLists)


### Name: calculate.maxK
### Title: The main function for TopKInference
### Aliases: calculate.maxK

### ** Examples

set.seed(1234)
data(breast)
truncated.lists = calculate.maxK(breast, d=6, v=10, L=3, threshold=50)
## Not run: 
##D aggmap(truncated.lists)
## End(Not run)



