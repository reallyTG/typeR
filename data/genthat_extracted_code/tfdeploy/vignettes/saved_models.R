## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  library(tfdeploy)
#  
#  test_images <- dataset_mnist()$test$x
#  test_images <- array_reshape(test_images, dim = c(nrow(test_images), 784)) / 255
#  test_images <- lapply(1:10, function(i) {test_images[i,]})
#  
#  predict_savedmodel(processed_test_list, 'savedmodel')

## ------------------------------------------------------------------------
#  # if there will only be one batch of predictions
#  predict_savedmodel(instances, 'savedmodel')
#  
#  # if there will be multiple batches of predictions
#  sess <- tensorflow::tf$Session()
#  graph <- load_savedmodel(sess, 'savedmodel')
#  predict_savedmodel(instances, graph)
#  # ... more work ...
#  predict_savedmodel(instances, graph)

