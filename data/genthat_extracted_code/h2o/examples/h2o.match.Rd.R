library(h2o)


### Name: h2o.match
### Title: Value Matching in H2O
### Aliases: h2o.match match.H2OFrame %in%

### ** Examples

## No test: 
h2o.init()
iris_hf <- as.h2o(iris)
h2o.match(iris_hf[, 5], c("setosa", "versicolor"))
## End(No test)



