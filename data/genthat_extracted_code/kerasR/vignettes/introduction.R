## ----setup, include=FALSE------------------------------------------------
# CRAN will not have keras installed, so create static vignette
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  library(kerasR)
#  mod <- Sequential()

## ------------------------------------------------------------------------
#  mod$add(Dense(units = 50, input_shape = 13))

## ------------------------------------------------------------------------
#  mod$add(Activation("relu"))

## ------------------------------------------------------------------------
#  mod$add(Dense(units = 1))

## ------------------------------------------------------------------------
#  keras_compile(mod,  loss = 'mse', optimizer = RMSprop())

## ------------------------------------------------------------------------
#  boston <- load_boston_housing()
#  X_train <- scale(boston$X_train)
#  Y_train <- boston$Y_train
#  X_test <- scale(boston$X_test)
#  Y_test <- boston$Y_test

## ------------------------------------------------------------------------
#  keras_fit(mod, X_train, Y_train,
#            batch_size = 32, epochs = 200,
#            verbose = 1, validation_split = 0.1)

## ------------------------------------------------------------------------
#  pred <- keras_predict(mod, normalize(X_test))
#  sd(as.numeric(pred) - Y_test) / sd(Y_test)

## ------------------------------------------------------------------------
#  mnist <- load_mnist()
#  X_train <- mnist$X_train
#  Y_train <- mnist$Y_train
#  X_test <- mnist$X_test
#  Y_test <- mnist$Y_test
#  dim(X_train)

## ------------------------------------------------------------------------
#  X_train <- array(X_train, dim = c(dim(X_train)[1], prod(dim(X_train)[-1]))) / 255
#  X_test <- array(X_test, dim = c(dim(X_test)[1], prod(dim(X_test)[-1]))) / 255

## ------------------------------------------------------------------------
#  Y_train <- to_categorical(mnist$Y_train, 10)

## ------------------------------------------------------------------------
#  mod <- Sequential()
#  
#  mod$add(Dense(units = 512, input_shape = dim(X_train)[2]))
#  mod$add(LeakyReLU())
#  mod$add(Dropout(0.25))
#  
#  mod$add(Dense(units = 512))
#  mod$add(LeakyReLU())
#  mod$add(Dropout(0.25))
#  
#  mod$add(Dense(units = 512))
#  mod$add(LeakyReLU())
#  mod$add(Dropout(0.25))
#  
#  mod$add(Dense(10))
#  mod$add(Activation("softmax"))

## ------------------------------------------------------------------------
#  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = RMSprop())
#  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5, verbose = 1,
#            validation_split = 0.1)

## ------------------------------------------------------------------------
#  Y_test_hat <- keras_predict_classes(mod, X_test)
#  table(Y_test, Y_test_hat)
#  mean(Y_test == Y_test_hat)

## ------------------------------------------------------------------------
#  mnist <- load_mnist()
#  
#  X_train <- array(mnist$X_train, dim = c(dim(mnist$X_train), 1)) / 255
#  Y_train <- to_categorical(mnist$Y_train, 10)
#  X_test <- array(mnist$X_test, dim = c(dim(mnist$X_test), 1)) / 255
#  Y_test <- mnist$Y_test

## ------------------------------------------------------------------------
#  mod <- Sequential()
#  
#  mod$add(Conv2D(filters = 32, kernel_size = c(3, 3),
#                 input_shape = c(28, 28, 1)))
#  mod$add(Activation("relu"))
#  mod$add(Conv2D(filters = 32, kernel_size = c(3, 3),
#                 input_shape = c(28, 28, 1)))
#  mod$add(Activation("relu"))
#  mod$add(MaxPooling2D(pool_size=c(2, 2)))
#  mod$add(Dropout(0.25))
#  
#  mod$add(Flatten())
#  mod$add(Dense(128))
#  mod$add(Activation("relu"))
#  mod$add(Dropout(0.25))
#  mod$add(Dense(10))
#  mod$add(Activation("softmax"))

## ------------------------------------------------------------------------
#  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = RMSprop())
#  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5, verbose = 1,
#            validation_split = 0.1)

## ------------------------------------------------------------------------
#  Y_test_hat <- keras_predict_classes(mod, X_test)
#  table(Y_test, Y_test_hat)
#  mean(Y_test == Y_test_hat)

## ------------------------------------------------------------------------
#  imdb <- load_imdb(num_words = 500, maxlen = 100)
#  
#  X_train <- pad_sequences(imdb$X_train[1:4000], maxlen = 100)
#  Y_train <- imdb$Y_train[1:4000]
#  X_test <- pad_sequences(imdb$X_train[4001:5736], maxlen = 100)
#  Y_test <- imdb$Y_train[4001:5736]

## ------------------------------------------------------------------------
#  mod <- Sequential()
#  
#  mod$add(Embedding(500, 32, input_length = 100, input_shape = c(100)))
#  mod$add(Dropout(0.25))
#  
#  mod$add(Flatten())
#  
#  mod$add(Dense(256))
#  mod$add(Dropout(0.25))
#  mod$add(Activation('relu'))
#  
#  mod$add(Dense(1))
#  mod$add(Activation('sigmoid'))

## ------------------------------------------------------------------------
#  keras_compile(mod,  loss = 'binary_crossentropy', optimizer = RMSprop(lr = 0.00025))
#  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 10, verbose = 1,
#            validation_split = 0.1)

## ------------------------------------------------------------------------
#  Y_test_hat <- keras_predict(mod, X_test)
#  table(Y_test, round(Y_test_hat))
#  mean(Y_test == as.numeric(round(Y_test_hat)))

## ------------------------------------------------------------------------
#  mod <- Sequential()
#  
#  mod$add(Embedding(500, 32, input_length = 100, input_shape = c(100)))
#  mod$add(Dropout(0.25))
#  
#  mod$add(LSTM(32))
#  
#  mod$add(Dense(256))
#  mod$add(Dropout(0.25))
#  mod$add(Activation('relu'))
#  
#  mod$add(Dense(1))
#  mod$add(Activation('sigmoid'))

## ------------------------------------------------------------------------
#  keras_compile(mod,  loss = 'binary_crossentropy', optimizer = RMSprop(lr = 0.00025))
#  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 10, verbose = 1,
#            validation_split = 0.1)

## ------------------------------------------------------------------------
#  Y_test_hat <- keras_predict(mod, X_test)
#  mean(Y_test == as.numeric(round(Y_test_hat)))

## ---- eval = FALSE-------------------------------------------------------
#  keras_save(mod, "full_model.h5")
#  keras_save_weights(mod, "weights_model.h5")
#  keras_model_to_json(mod, "model_architecture.json")

## ---- eval = FALSE-------------------------------------------------------
#  mod <- keras_load("full_model.h5")
#  keras_load_weights(mod, tf)
#  mod <- keras_model_to_json("model_architecture.json")

## ------------------------------------------------------------------------
#  inception <- InceptionV3(weights='imagenet')

## ------------------------------------------------------------------------
#  img <- load_img("elephant.jpg", target_size = c(299, 299))
#  x <- img_to_array(img)
#  x <- expand_dims(x, axis = 0)

## ------------------------------------------------------------------------
#  x <- x / 255

## ------------------------------------------------------------------------
#  pred <- keras_predict(inception, x)

## ------------------------------------------------------------------------
#  > unlist(decode_predictions(pred, model = "InceptionV3", top = 3))
#  [1] "n01871265"         "tusker"            "0.546035408973694"
#  [4] "n02504013"         "Indian_elephant"   "0.247862368822098"
#  [7] "n02504458"         "African_elephant"  "0.143739387392998"

