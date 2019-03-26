library(h2o)


### Name: h2o.scale
### Title: Scaling and Centering of an H2OFrame
### Aliases: h2o.scale scale.H2OFrame

### ** Examples

## No test: 
library(h2o)
h2o.init()
iris_hf <- as.h2o(iris)
summary(iris_hf)

# Scale and center all the numeric columns in iris data set
scale(iris_hf[, 1:4])
## End(No test)



