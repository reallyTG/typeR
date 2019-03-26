## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 32, input_shape = c(784)) %>%
#    layer_activation('relu') %>%
#    layer_dense(units = 10) %>%
#    layer_activation('softmax')

## ------------------------------------------------------------------------
#  tweet_a <- layer_input(shape = c(140, 256))
#  tweet_b <- layer_input(shape = c(140, 256))
#  
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

