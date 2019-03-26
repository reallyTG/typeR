## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  install.packages(tfdeploy)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # load data
#  c(c(x_train, y_train), c(x_test, y_test)) %<-% dataset_mnist()
#  
#  # reshape and rescale
#  x_train <- array_reshape(x_train, dim = c(nrow(x_train), 784)) / 255
#  x_test <- array_reshape(x_test, dim = c(nrow(x_test), 784)) / 255
#  
#  # one-hot encode response
#  y_train <- to_categorical(y_train, 10)
#  y_test <- to_categorical(y_test, 10)
#  
#  # define and compile model
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 256, activation = 'relu', input_shape = c(784),
#                name = "image") %>%
#    layer_dense(units = 128, activation = 'relu') %>%
#    layer_dense(units = 10, activation = 'softmax',
#                name = "prediction") %>%
#    compile(
#      loss = 'categorical_crossentropy',
#      optimizer = optimizer_rmsprop(),
#      metrics = c('accuracy')
#    )
#  
#  # train model
#  history <- model %>% fit(
#    x_train, y_train,
#    epochs = 35, batch_size = 128,
#    validation_split = 0.2
#  )

## ------------------------------------------------------------------------
#  preds <- predict(model, x_test[1:5,])

## ------------------------------------------------------------------------
#  library(tfdeploy)
#  export_savedmodel(model, "savedmodel")

## ------------------------------------------------------------------------
#  view_savedmodel("savedmodel")

## ------------------------------------------------------------------------
#  library(tfdeploy)
#  serve_savedmodel('savedmodel', browse = TRUE)

## ------------------------------------------------------------------------
#  library(cloudml)
#  cloudml_deploy("savedmodel", name = "keras_mnist", version = "keras_mnist_1")

## ------------------------------------------------------------------------
#  export_savedmodel(model, "savedmodel")

## ------------------------------------------------------------------------
#  library(tfestimators)
#  
#  mtcars_input_fn <- function(data, num_epochs = 1) {
#    input_fn(data,
#             features = c("disp", "cyl"),
#             response = "mpg",
#             batch_size = 32,
#             num_epochs = num_epochs)
#  }
#  
#  cols <- feature_columns(column_numeric("disp"), column_numeric("cyl"))
#  
#  model <- linear_regressor(feature_columns = cols)
#  
#  indices <- sample(1:nrow(mtcars), size = 0.80 * nrow(mtcars))
#  train <- mtcars[indices, ]
#  test  <- mtcars[-indices, ]
#  
#  model %>% train(mtcars_input_fn(train, num_epochs = 10))
#  
#  export_savedmodel(model, "savedmodel")

## ------------------------------------------------------------------------
#  library(tensorflow)
#  
#  sess <- tf$Session()
#  datasets <- tf$contrib$learn$datasets
#  mnist <- datasets$mnist$read_data_sets("MNIST-data", one_hot = TRUE)
#  
#  # Note that we define x as the input tensor
#  # and y as the output tensor that will contain
#  # the scores. These are referenced in export_savedmodel
#  x <- tf$placeholder(tf$float32, shape(NULL, 784L))
#  W <- tf$Variable(tf$zeros(shape(784L, 10L)))
#  b <- tf$Variable(tf$zeros(shape(10L)))
#  y <- tf$nn$softmax(tf$matmul(x, W) + b)
#  y_ <- tf$placeholder(tf$float32, shape(NULL, 10L))
#  cross_entropy <- tf$reduce_mean(
#    -tf$reduce_sum(y_ * tf$log(y), reduction_indices=1L)
#  )
#  
#  optimizer <- tf$train$GradientDescentOptimizer(0.5)
#  train_step <- optimizer$minimize(cross_entropy)
#  
#  init <- tf$global_variables_initializer()
#  sess$run(init)
#  
#  for (i in 1:1000) {
#    batches <- mnist$train$next_batch(100L)
#    batch_xs <- batches[[1]]
#    batch_ys <- batches[[2]]
#    sess$run(train_step,
#             feed_dict = dict(x = batch_xs, y_ = batch_ys))
#  }
#  
#  export_savedmodel(
#    sess,
#    "savedmodel",
#    inputs = list(image_input = x),
#    outputs = list(scores = y))

## ------------------------------------------------------------------------
#  library(cloudml)
#  cloudml_deploy("savedmodel", name = "keras_mnist")

## ------------------------------------------------------------------------
#  library(rsconnect)
#  deployTFModel('savedmodel', account = <username>, server = <internal_connect_server>)

