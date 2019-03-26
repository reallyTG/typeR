library(kerasR)


### Name: LoadSave
### Title: Load and save keras models
### Aliases: LoadSave keras_save keras_load keras_save_weights
###   keras_load_weights keras_model_to_json keras_model_from_json

### ** Examples

if (keras_available()) {
  # X_train <- matrix(rnorm(100 * 10), nrow = 100)
  # Y_train <- to_categorical(matrix(sample(0:2, 100, TRUE), ncol = 1), 3)
  mod <- Sequential()
  mod$add(Dense(units = 50, input_shape = 10))
  mod$add(Dropout(rate = 0.5))
  mod$add(Activation("relu"))
  mod$add(Dense(units = 3))
  mod$add(ActivityRegularization(l1 = 1))
  mod$add(Activation("softmax"))
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = RMSprop())
  # keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
  #           verbose = 0, validation_split = 0.2)
  
  # save/load the entire model object
  keras_save(mod, tf <- tempfile())
  mod2 <- keras_load(tf)
  
  # save/load just the weights file
  keras_save_weights(mod, tf <- tempfile())
  keras_load_weights(mod, tf)
  
  # save/load just the architecture (as human readable json)
  tf <- tempfile(fileext = ".json")
  keras_model_to_json(mod, tf)
  cat(readLines(tf))
  mod3 <- keras_model_from_json(tf)
}



