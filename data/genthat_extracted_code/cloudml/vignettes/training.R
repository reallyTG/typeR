## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval=FALSE)

## ------------------------------------------------------------------------
#  library(cloudml)
#  job <- cloudml_train("mnist_mlp.R")

## ------------------------------------------------------------------------
#  job_status(job)

## ------------------------------------------------------------------------
#  job_status()   # get status of last job

## ------------------------------------------------------------------------
#  job_collect()     # collect last job
#  job_collect(job)  # collect specific job

## ------------------------------------------------------------------------
#  ls_runs()

## ------------------------------------------------------------------------
#  # view the latest run
#  view_run()
#  
#  # view a specific run
#  view_run("runs/cloudml_2017_12_15_182614794")

## ------------------------------------------------------------------------
#  job_list()

## ------------------------------------------------------------------------
#  job_status("cloudml_2017_12_18_203510175")

## ------------------------------------------------------------------------
#  job_stream_logs("cloudml_2017_12_18_203510175")

## ------------------------------------------------------------------------
#  job_cancel("cloudml_2017_12_18_203510175")

## ------------------------------------------------------------------------
#  library(keras)
#  
#  FLAGS <- flags(
#    flag_integer("dense_units1", 128),
#    flag_numeric("dropout1", 0.4),
#    flag_integer("dense_units2", 128),
#    flag_numeric("dropout2", 0.3),
#  )

## ------------------------------------------------------------------------
#  input <- layer_input(shape = c(784))
#  predictions <- input %>%
#    layer_dense(units = FLAGS$dense_units1, activation = 'relu') %>%
#    layer_dropout(rate = FLAGS$dropout1) %>%
#    layer_dense(units = FLAGS$dense_units2, activation = 'relu') %>%
#    layer_dropout(rate = FLAGS$dropout2) %>%
#    layer_dense(units = 10, activation = 'softmax')
#  
#  model <- keras_model(input, predictions) %>% compile(
#    loss = 'categorical_crossentropy',
#    optimizer = optimizer_rmsprop(lr = 0.001),
#    metrics = c('accuracy')
#  )
#  
#  history <- model %>% fit(
#    x_train, y_train,
#    batch_size = 128,
#    epochs = 30,
#    verbose = 1,
#    validation_split = 0.2
#  )

## ------------------------------------------------------------------------
#  cloudml_train("minst_mlp.R", flags = list(dropout1 = 0.3, dropout2 = 0.2))

## ------------------------------------------------------------------------
#  cloudml_train("train.R", master_type = "standard_gpu")

## ------------------------------------------------------------------------
#  cloudml_train("train.R", master_type = "standard_p100")

## ------------------------------------------------------------------------
#  cloudml_train("train.R", master_type = "complex_model_m_p100")

## ------------------------------------------------------------------------
#  cloudml_train("mnist_mlp.R", config = "tuning.yml")

