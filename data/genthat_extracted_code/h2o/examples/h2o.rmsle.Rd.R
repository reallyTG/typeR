library(h2o)


### Name: h2o.rmsle
### Title: Retrieve the Root Mean Squared Log Error
### Aliases: h2o.rmsle

### ** Examples

## No test: 
library(h2o)

h <- h2o.init()
fr <- as.h2o(iris)

m <- h2o.deeplearning(x = 2:5, y = 1, training_frame = fr)

h2o.rmsle(m)
## End(No test)



