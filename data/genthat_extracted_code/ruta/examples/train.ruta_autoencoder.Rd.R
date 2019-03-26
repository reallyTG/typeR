library(ruta)


### Name: train.ruta_autoencoder
### Title: Train a learner object with data
### Aliases: train.ruta_autoencoder train

### ** Examples

# Minimal example ================================================
## No test: 
iris_model <- train(autoencoder(2), as.matrix(iris[, 1:4]))
## End(No test)

# Simple example with MNIST ======================================
## No test: 
library(keras)

# Load and normalize MNIST
mnist = dataset_mnist()
x_train <- array_reshape(
  mnist$train$x, c(dim(mnist$train$x)[1], 784)
)
x_train <- x_train / 255.0
x_test <- array_reshape(
  mnist$test$x, c(dim(mnist$test$x)[1], 784)
)
x_test <- x_test / 255.0

# Autoencoder with layers: 784-256-36-256-784
learner <- autoencoder(c(256, 36), "binary_crossentropy")
train(
  learner,
  x_train,
  epochs = 1,
  optimizer = "rmsprop",
  batch_size = 64,
  validation_data = x_test,
  metrics = list("binary_accuracy")
)
## End(No test)



