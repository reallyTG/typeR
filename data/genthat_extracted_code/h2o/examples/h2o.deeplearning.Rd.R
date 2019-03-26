library(h2o)


### Name: h2o.deeplearning
### Title: Build a Deep Neural Network model using CPUs
### Aliases: h2o.deeplearning

### ** Examples

## No test: 
library(h2o)
h2o.init()
iris_hf <- as.h2o(iris)
iris_dl <- h2o.deeplearning(x = 1:4, y = 5, training_frame = iris_hf, seed=123456)

# now make a prediction
predictions <- h2o.predict(iris_dl, iris_hf)
## End(No test)



