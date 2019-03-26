library(h2o)


### Name: h2o.mean_residual_deviance
### Title: Retrieve the Mean Residual Deviance value
### Aliases: h2o.mean_residual_deviance

### ** Examples

## No test: 
library(h2o)

h <- h2o.init()
fr <- as.h2o(iris)

m <- h2o.deeplearning(x = 2:5, y = 1, training_frame = fr)

h2o.mean_residual_deviance(m)
## End(No test)



