library(h2o)


### Name: h2o.nacnt
### Title: Count of NAs per column
### Aliases: h2o.nacnt

### ** Examples

## No test: 
h2o.init()
iris_hf <- as.h2o(iris)
h2o.nacnt(iris_hf)  # should return all 0s
h2o.insertMissingValues(iris_hf)
h2o.nacnt(iris_hf)
## End(No test)



