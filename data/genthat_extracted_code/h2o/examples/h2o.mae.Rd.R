library(h2o)


### Name: h2o.mae
### Title: Retrieve the Mean Absolute Error Value
### Aliases: h2o.mae

### ** Examples

## No test: 
library(h2o)

h <- h2o.init()
fr <- as.h2o(iris)

m <- h2o.deeplearning(x = 2:5, y = 1, training_frame = fr)

h2o.mae(m)
## End(No test)



