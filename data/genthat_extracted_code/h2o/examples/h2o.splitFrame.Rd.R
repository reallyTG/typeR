library(h2o)


### Name: h2o.splitFrame
### Title: Split an H2O Data Set
### Aliases: h2o.splitFrame

### ** Examples

## No test: 
library(h2o)
h2o.init()
iris_hf <- as.h2o(iris)
iris_split <- h2o.splitFrame(iris_hf, ratios = c(0.2, 0.5))
head(iris_split[[1]])
summary(iris_split[[1]])
## End(No test)



