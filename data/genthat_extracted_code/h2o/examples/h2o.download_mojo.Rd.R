library(h2o)


### Name: h2o.download_mojo
### Title: Download the model in MOJO format.
### Aliases: h2o.download_mojo

### ** Examples

## No test: 
library(h2o)
h <- h2o.init()
fr <- as.h2o(iris)
my_model <- h2o.gbm(x = 1:4, y = 5, training_frame = fr)
h2o.download_mojo(my_model)  # save to the current working directory
## End(No test)



