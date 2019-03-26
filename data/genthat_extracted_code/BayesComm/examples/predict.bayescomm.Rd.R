library(BayesComm)


### Name: predict.bayescomm
### Title: Function to make predictions at new locations
### Aliases: predict.bayescomm

### ** Examples

# load model from first example
m1 <- example(BC)[[1]]

# use the first five sites of the training data as newdata
newdata <- X[1:5, -1]

# get predictions
prob <- predict(m1, newdata)



