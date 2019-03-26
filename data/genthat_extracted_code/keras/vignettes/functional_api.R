## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # input layer
#  inputs <- layer_input(shape = c(784))
#  
#  # outputs compose input + dense layers
#  predictions <- inputs %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dense(units = 10, activation = 'softmax')
#  
#  # create and compile model
#  model <- keras_model(inputs = inputs, outputs = predictions)
#  model %>% compile(
#    optimizer = 'rmsprop',
#    loss = 'categorical_crossentropy',
#    metrics = c('accuracy')
#  )

## ------------------------------------------------------------------------
#  x <- layer_input(shape = c(784))
#  # This works, and returns the 10-way softmax we defined above.
#  y <- x %>% model

## ------------------------------------------------------------------------
#  # Input tensor for sequences of 20 timesteps,
#  # each containing a 784-dimensional vector
#  input_sequences <- layer_input(shape = c(20, 784))
#  
#  # This applies our previous model to the input sequence
#  processed_sequences <- input_sequences %>%
#    time_distributed(model)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  main_input <- layer_input(shape = c(100), dtype = 'int32', name = 'main_input')
#  
#  lstm_out <- main_input %>%
#    layer_embedding(input_dim = 10000, output_dim = 512, input_length = 100) %>%
#    layer_lstm(units = 32)

## ------------------------------------------------------------------------
#  auxiliary_output <- lstm_out %>%
#    layer_dense(units = 1, activation = 'sigmoid', name = 'aux_output')

## ------------------------------------------------------------------------
#  auxiliary_input <- layer_input(shape = c(5), name = 'aux_input')
#  
#  main_output <- layer_concatenate(c(lstm_out, auxiliary_input)) %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dense(units = 1, activation = 'sigmoid', name = 'main_output')

## ------------------------------------------------------------------------
#  model <- keras_model(
#    inputs = c(main_input, auxiliary_input),
#    outputs = c(main_output, auxiliary_output)
#  )

## ------------------------------------------------------------------------
#  summary(model)

## ------------------------------------------------------------------------
#  model %>% compile(
#    optimizer = 'rmsprop',
#    loss = 'binary_crossentropy',
#    loss_weights = c(1.0, 0.2)
#  )

## ---- eval = FALSE-------------------------------------------------------
#  model %>% fit(
#    x = list(headline_data, additional_data),
#    y = list(labels, labels),
#    epochs = 50,
#    batch_size = 32
#  )

## ---- eval = FALSE-------------------------------------------------------
#  model %>% compile(
#    optimizer = 'rmsprop',
#    loss = list(main_output = 'binary_crossentropy', aux_output = 'binary_crossentropy'),
#    loss_weights = list(main_output = 1.0, aux_output = 0.2)
#  )
#  
#  # And trained it via:
#  model %>% fit(
#    x = list(main_input = headline_data, aux_input = additional_data),
#    y = list(main_output = labels, aux_output = labels),
#    epochs = 50,
#    batch_size = 32
#  )

## ------------------------------------------------------------------------
#  library(keras)
#  
#  tweet_a <- layer_input(shape = c(280, 256))
#  tweet_b <- layer_input(shape = c(280, 256))

## ----eval=FALSE----------------------------------------------------------
#  # This layer can take as input a matrix and will return a vector of size 64
#  shared_lstm <- layer_lstm(units = 64)
#  
#  # When we reuse the same layer instance multiple times, the weights of the layer are also
#  # being reused (it is effectively *the same* layer)
#  encoded_a <- tweet_a %>% shared_lstm
#  encoded_b <- tweet_b %>% shared_lstm
#  
#  # We can then concatenate the two vectors and add a logistic regression on top
#  predictions <- layer_concatenate(c(encoded_a, encoded_b), axis=-1) %>%
#    layer_dense(units = 1, activation = 'sigmoid')
#  
#  # We define a trainable model linking the tweet inputs to the predictions
#  model <- keras_model(inputs = c(tweet_a, tweet_b), outputs = predictions)
#  
#  model %>% compile(
#    optimizer = 'rmsprop',
#    loss = 'binary_crossentropy',
#    metrics = c('accuracy')
#  )
#  
#  model %>% fit(list(data_a, data_b), labels, epochs = 10)
#  

## ------------------------------------------------------------------------
#  a <- layer_input(shape = c(280, 256))
#  
#  lstm <- layer_lstm(units = 32)
#  
#  encoded_a <- a %>% lstm
#  
#  lstm$output

## ------------------------------------------------------------------------
#  a <- layer_input(shape = c(280, 256))
#  b <- layer_input(shape = c(280, 256))
#  
#  lstm <- layer_lstm(units = 32)
#  
#  encoded_a <- a %>% lstm
#  encoded_b <- b %>% lstm
#  
#  lstm$output

## ------------------------------------------------------------------------
#  get_output_at(lstm, 1)
#  get_output_at(lstm, 2)

## ------------------------------------------------------------------------
#  a <- layer_input(shape = c(32, 32, 3))
#  b <- layer_input(shape = c(64, 64, 3))
#  
#  conv <- layer_conv_2d(filters = 16, kernel_size = c(3,3), padding = 'same')
#  
#  conved_a <- a %>% conv
#  
#  # only one input so far, the following will work
#  conv$input_shape
#  
#  conved_b <- b %>% conv
#  # now the `$input_shape` property wouldn't work, but this does:
#  get_input_shape_at(conv, 1)
#  get_input_shape_at(conv, 2)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  input_img <- layer_input(shape = c(256, 256, 3))
#  
#  tower_1 <- input_img %>%
#    layer_conv_2d(filters = 64, kernel_size = c(1, 1), padding='same', activation='relu') %>%
#    layer_conv_2d(filters = 64, kernel_size = c(3, 3), padding='same', activation='relu')
#  
#  tower_2 <- input_img %>%
#    layer_conv_2d(filters = 64, kernel_size = c(1, 1), padding='same', activation='relu') %>%
#    layer_conv_2d(filters = 64, kernel_size = c(5, 5), padding='same', activation='relu')
#  
#  tower_3 <- input_img %>%
#    layer_max_pooling_2d(pool_size = c(3, 3), strides = c(1, 1), padding = 'same') %>%
#    layer_conv_2d(filters = 64, kernel_size = c(1, 1), padding='same', activation='relu')
#  
#  output <- layer_concatenate(c(tower_1, tower_2, tower_3), axis = 1)
#  

## ------------------------------------------------------------------------
#  # input tensor for a 3-channel 256x256 image
#  x <- layer_input(shape = c(256, 256, 3))
#  # 3x3 conv with 3 output channels (same as input channels)
#  y <- x %>% layer_conv_2d(filters = 3, kernel_size =c(3, 3), padding = 'same')
#  # this returns x + y.
#  z <- layer_add(c(x, y))

## ------------------------------------------------------------------------
#  # First, define the vision model
#  digit_input <- layer_input(shape = c(27, 27, 1))
#  out <- digit_input %>%
#    layer_conv_2d(filters = 64, kernel_size = c(3, 3)) %>%
#    layer_conv_2d(filters = 64, kernel_size = c(3, 3)) %>%
#    layer_max_pooling_2d(pool_size = c(2, 2)) %>%
#    layer_flatten()
#  
#  vision_model <- keras_model(digit_input, out)
#  
#  # Then define the tell-digits-apart model
#  digit_a <- layer_input(shape = c(27, 27, 1))
#  digit_b <- layer_input(shape = c(27, 27, 1))
#  
#  # The vision model will be shared, weights and all
#  out_a <- digit_a %>% vision_model
#  out_b <- digit_b %>% vision_model
#  
#  out <- layer_concatenate(c(out_a, out_b)) %>%
#    layer_dense(units = 1, activation = 'sigmoid')
#  
#  classification_model <- keras_model(inputs = c(digit_a, digit_b), out)

## ------------------------------------------------------------------------
#  # First, let's define a vision model using a Sequential model.
#  # This model will encode an image into a vector.
#  vision_model <- keras_model_sequential()
#  vision_model %>%
#    layer_conv_2d(filters = 64, kernel_size = c(3, 3), activation = 'relu', padding = 'same',
#                  input_shape = c(224, 224, 3)) %>%
#    layer_conv_2d(filters = 64, kernel_size = c(3, 3), activation = 'relu') %>%
#    layer_max_pooling_2d(pool_size = c(2, 2)) %>%
#    layer_conv_2d(filters = 128, kernel_size = c(3, 3), activation = 'relu', padding = 'same') %>%
#    layer_conv_2d(filters = 128, kernel_size = c(3, 3), activation = 'relu') %>%
#    layer_max_pooling_2d(pool_size = c(2, 2)) %>%
#    layer_conv_2d(filters = 256, kernel_size = c(3, 3), activation = 'relu', padding = 'same') %>%
#    layer_conv_2d(filters = 256, kernel_size = c(3, 3), activation = 'relu') %>%
#    layer_conv_2d(filters = 256, kernel_size = c(3, 3), activation = 'relu') %>%
#    layer_max_pooling_2d(pool_size = c(2, 2)) %>%
#    layer_flatten()
#  
#  # Now let's get a tensor with the output of our vision model:
#  image_input <- layer_input(shape = c(224, 224, 3))
#  encoded_image <- image_input %>% vision_model
#  
#  # Next, let's define a language model to encode the question into a vector.
#  # Each question will be at most 100 word long,
#  # and we will index words as integers from 1 to 9999.
#  question_input <- layer_input(shape = c(100), dtype = 'int32')
#  encoded_question <- question_input %>%
#    layer_embedding(input_dim = 10000, output_dim = 256, input_length = 100) %>%
#    layer_lstm(units = 256)
#  
#  # Let's concatenate the question vector and the image vector then
#  # train a logistic regression over 1000 words on top
#  output <- layer_concatenate(c(encoded_question, encoded_image)) %>%
#    layer_dense(units = 1000, activation='softmax')
#  
#  # This is our final model:
#  vqa_model <- keras_model(inputs = c(image_input, question_input), outputs = output)

## ------------------------------------------------------------------------
#  video_input <- layer_input(shape = c(100, 224, 224, 3))
#  
#  # This is our video encoded via the previously trained vision_model (weights are reused)
#  encoded_video <- video_input %>%
#    time_distributed(vision_model) %>%
#    layer_lstm(units = 256)
#  
#  # This is a model-level representation of the question encoder, reusing the same weights as before:
#  question_encoder <- keras_model(inputs = question_input, outputs = encoded_question)
#  
#  # Let's use it to encode the question:
#  video_question_input <- layer_input(shape = c(100), dtype = 'int32')
#  encoded_video_question <- video_question_input %>% question_encoder
#  
#  # And this is our video question answering model:
#  output <- layer_concatenate(c(encoded_video, encoded_video_question)) %>%
#    layer_dense(units = 1000, activation = 'softmax')
#  
#  video_qa_model <- keras_model(inputs= c(video_input, video_question_input), outputs = output)

