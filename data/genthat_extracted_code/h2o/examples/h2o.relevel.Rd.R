library(h2o)


### Name: h2o.relevel
### Title: Reorders levels of an H2O factor, similarly to standard R's
###   relevel.
### Aliases: h2o.relevel

### ** Examples

## No test: 
library(h2o)
h2o.init()

# Convert iris dataset to an H2OFrame
iris_hf <- as.h2o(iris)
# Look at current ordering of the Species column levels
h2o.levels(iris_hf["Species"])
# "setosa"     "versicolor" "virginica" 
# Change the reference level to "virginica"
iris_hf["Species"] <- h2o.relevel(x = iris_hf["Species"], y = "virginica")
# Observe new ordering
h2o.levels(iris_hf["Species"])
# "virginica"  "setosa"     "versicolor"
## End(No test)



