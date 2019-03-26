library(kerasR)


### Name: Embedding
### Title: Embedding layer
### Aliases: Embedding

### ** Examples

if(keras_available()) {
  X_train <- matrix(sample(0:19, 100 * 100, TRUE), ncol = 100)
  Y_train <- rnorm(100)
  
  mod <- Sequential()
  mod$add(Embedding(input_dim = 20, output_dim = 10,
                    input_length = 100))
  mod$add(Dropout(0.5))
  
  mod$add(GRU(16))
  mod$add(Dense(1))
  mod$add(Activation("sigmoid"))
  
  keras_compile(mod, loss = "mse", optimizer = RMSprop())
  keras_fit(mod, X_train, Y_train, epochs = 3, verbose = 0)
}



