## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval=FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  FLAGS <- flags(
#    flag_integer("dense_units1", 128),
#    flag_numeric("dropout1", 0.4),
#    flag_integer("dense_units2", 128),
#    flag_numeric("dropout2", 0.3)
#  )

## ------------------------------------------------------------------------
#  model <- keras_model_sequential() %>%
#    layer_dense(units = FLAGS$dense_units1, activation = 'relu',
#                input_shape = c(784)) %>%
#    layer_dropout(rate = FLAGS$dropout1) %>%
#    layer_dense(units = FLAGS$dense_units2, activation = 'relu') %>%
#    layer_dropout(rate = FLAGS$dropout2) %>%
#    layer_dense(units = 10, activation = 'softmax')

## ------------------------------------------------------------------------
#  model %>% compile(
#    loss = 'categorical_crossentropy',
#    optimizer = optimizer_rmsprop(),
#    metrics = c('accuracy')
#  )

## ------------------------------------------------------------------------
#  cloudml_train("mnist_mlp.R", config = "tuning.yml")

## ------------------------------------------------------------------------
#  job_trials("cloudml_2018_01_08_142717956")

## ------------------------------------------------------------------------
#  job_collect("cloudml_2018_01_08_142717956")

## ------------------------------------------------------------------------
#  job_collect("cloudml_2018_01_08_142717956", trials = "all")

## ------------------------------------------------------------------------
#  trials <- job_trials("cloudml_2018_01_08_142717956")
#  job_collect("cloudml_2018_01_08_142717956", trials = trials$trialId[1:5])

## ------------------------------------------------------------------------
#  summary <- tf$Summary()
#  summary$value$add(tag = "accuracy", simple_value = accuracy)
#  summary_writer$add_summary(summary, iteration_number)

