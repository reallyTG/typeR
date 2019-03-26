## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  library(dplyr)
#  library(ggplot2)
#  library(purrr)

## ------------------------------------------------------------------------
#  imdb <- dataset_imdb(num_words = 10000)
#  
#  c(train_data, train_labels) %<-% imdb$train
#  c(test_data, test_labels) %<-% imdb$test

## ------------------------------------------------------------------------
#  word_index <- dataset_imdb_word_index()

## ------------------------------------------------------------------------
#  paste0("Training entries: ", length(train_data), ", labels: ", length(train_labels))

## ------------------------------------------------------------------------
#  train_data[[1]]

## ------------------------------------------------------------------------
#  length(train_data[[1]])
#  length(train_data[[2]])

## ------------------------------------------------------------------------
#  word_index_df <- data.frame(
#    word = names(word_index),
#    idx = unlist(word_index, use.names = FALSE),
#    stringsAsFactors = FALSE
#  )
#  
#  # The first indices are reserved
#  word_index_df <- word_index_df %>% mutate(idx = idx + 3)
#  word_index_df <- word_index_df %>%
#    add_row(word = "<PAD>", idx = 0)%>%
#    add_row(word = "<START>", idx = 1)%>%
#    add_row(word = "<UNK>", idx = 2)%>%
#    add_row(word = "<UNUSED>", idx = 3)
#  
#  word_index_df <- word_index_df %>% arrange(idx)
#  
#  decode_review <- function(text){
#    paste(map(text, function(number) word_index_df %>%
#                filter(idx == number) %>%
#                select(word) %>%
#                pull()),
#          collapse = " ")
#  }

## ------------------------------------------------------------------------
#  decode_review(train_data[[1]])

## ------------------------------------------------------------------------
#  train_data <- pad_sequences(
#    train_data,
#    value = word_index_df %>% filter(word == "<PAD>") %>% select(idx) %>% pull(),
#    padding = "post",
#    maxlen = 256
#  )
#  
#  test_data <- pad_sequences(
#    test_data,
#    value = word_index_df %>% filter(word == "<PAD>") %>% select(idx) %>% pull(),
#    padding = "post",
#    maxlen = 256
#  )

## ------------------------------------------------------------------------
#  length(train_data[1, ])
#  length(train_data[2, ])

## ------------------------------------------------------------------------
#  train_data[1, ]

## ------------------------------------------------------------------------
#  # input shape is the vocabulary count used for the movie reviews (10,000 words)
#  vocab_size <- 10000
#  
#  model <- keras_model_sequential()
#  model %>%
#    layer_embedding(input_dim = vocab_size, output_dim = 16) %>%
#    layer_global_average_pooling_1d() %>%
#    layer_dense(units = 16, activation = "relu") %>%
#    layer_dense(units = 1, activation = "sigmoid")
#  
#  model %>% summary()

## ------------------------------------------------------------------------
#  model %>% compile(
#    optimizer = 'adam',
#    loss = 'binary_crossentropy',
#    metrics = list('accuracy')
#  )

## ------------------------------------------------------------------------
#  x_val <- train_data[1:10000, ]
#  partial_x_train <- train_data[10001:nrow(train_data), ]
#  
#  y_val <- train_labels[1:10000]
#  partial_y_train <- train_labels[10001:length(train_labels)]

## ------------------------------------------------------------------------
#  history <- model %>% fit(
#    partial_x_train,
#    partial_y_train,
#    epochs = 40,
#    batch_size = 512,
#    validation_data = list(x_val, y_val),
#    verbose=1
#  )

## ------------------------------------------------------------------------
#  results <- model %>% evaluate(test_data, test_labels)
#  results

## ------------------------------------------------------------------------
#  plot(history)

