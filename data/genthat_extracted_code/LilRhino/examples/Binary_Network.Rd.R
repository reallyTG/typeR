library(LilRhino)


### Name: Binary_Network
### Title: Binary Decision Neural Network Wrapper
### Aliases: Binary_Network
### Keywords: NeuralNetwork FeedNetwork

### ** Examples

## No test: 
  #Feed Network Testing
  library(keras)
  library(dplyr)
  dat <- keras::dataset_mnist()
  X_train = array_reshape(dat$train$x/255, c(nrow(dat$train$x/255), 784))
  y_train = to_categorical(dat$train$y, 10)
  X_test = array_reshape(dat$test$x/255, c(nrow(dat$test$x/255), 784))
  y_test =to_categorical(dat$test$y, 10)


  index_train = which(dat$train$y == 6 | dat$train$y == 5)
  index_train = sample(index_train, length(index_train))
  index_test = which(dat$test$y == 6 | dat$test$y == 5)
  index_test = sample(index_test, length(index_test))

  temp = Binary_Network(X_train[index_train,],
  y_train[index_train,c(7, 6)], X_test[index_test,], .3, 350, 30, 50)
  
## End(No test)



