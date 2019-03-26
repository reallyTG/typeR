library(h2o)


### Name: as.matrix.H2OFrame
### Title: Convert an H2OFrame to a matrix
### Aliases: as.matrix.H2OFrame

### ** Examples

## No test: 
h2o.init()
iris_hf <- as.h2o(iris)
describe <- h2o.describe(iris_hf)
mins = as.matrix(apply(iris_hf, 2, min))
print(mins)
## End(No test)



