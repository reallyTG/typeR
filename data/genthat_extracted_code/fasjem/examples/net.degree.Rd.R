library(fasjem)


### Name: net.degree
### Title: List the degree of every node of each graph in the input list of
###   multiple graphs.
### Aliases: net.degree
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D ## load an example multi-task dataset with K=2 tasks, p=100 features, and n=200 samples per task:
##D data(exampleData)
##D ##run
##D result = fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
##D ## get degree list:
##D net.degree(result)
## End(Not run)



