library(fasjem)


### Name: net.hubs
### Title: Get degrees of the most connected nodes of each graph in the
###   input list of multiple graphs.
### Aliases: net.hubs
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D ## load an example multi-task dataset with K=2 tasks, p=100 features, and n=200 samples per task:
##D data(exampleData)
##D ##run
##D result = fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
##D ## get hubs list:
##D net.hubs(result)
## End(Not run)



