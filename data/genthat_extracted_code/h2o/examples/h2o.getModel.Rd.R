library(h2o)


### Name: h2o.getModel
### Title: Get an R reference to an H2O model
### Aliases: h2o.getModel

### ** Examples

## No test: 
library(h2o)
h2o.init()

iris_hf <- as.h2o(iris)
model_id <- h2o.gbm(x = 1:4, y = 5, training_frame = iris_hf)@model_id
model_retrieved <- h2o.getModel(model_id)
## End(No test)



