library(kerasR)


### Name: Regularizers
### Title: Apply penalties on layer parameters
### Aliases: Regularizers l1 l2 l1_l2

### ** Examples

if(keras_available()) {
  X_train <- matrix(rnorm(100 * 10), nrow = 100)
  Y_train <- to_categorical(matrix(sample(0:2, 100, TRUE), ncol = 1), 3)
  
  mod <- Sequential()
  mod$add(Dense(units = 50, input_shape = dim(X_train)[2]))
  mod$add(Activation("relu"))
  mod$add(Dense(units = 3, kernel_regularizer = l1(l = 0.05),
                bias_regularizer = l2(l = 0.05)))
  mod$add(Dense(units = 3, kernel_regularizer = l1_l2(l1 = 0.05, l2 = 0.1)))
  mod$add(Activation("softmax"))
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = RMSprop())
  
  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5, verbose = 0)
}



