## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  FLAGS <- flags(
#    flag_numeric("dropout1", 0.4),
#    flag_numeric("dropout2", 0.3)
#  )

## ------------------------------------------------------------------------
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 128, activation = 'relu', input_shape = c(784)) %>%
#    layer_dropout(rate = FLAGS$dropout1) %>%
#    layer_dense(units = 128, activation = 'relu') %>%
#    layer_dropout(rate = FLAGS$dropout2) %>%
#    layer_dense(units = 10, activation = 'softmax')

## ------------------------------------------------------------------------
#  training_run('mnist_mlp.R', flags = list(dropout1 = 0.2, dropout2 = 0.2))

## ------------------------------------------------------------------------
#  for (dropout1 in c(0.1, 0.2, 0.3))
#    training_run('mnist_mlp.R', flags = list(dropout1 = dropout1))

## ------------------------------------------------------------------------
#  # run various combinations of dropout1 and dropout2
#  runs <- tuning_run("mnist_mlp.R", flags = list(
#    dropout1 = c(0.2, 0.3, 0.4),
#    dropout2 = c(0.2, 0.3, 0.4)
#  ))
#  
#  # find the best evaluation accuracy
#  runs[order(runs$eval_acc, decreasing = TRUE), ]

## ------------------------------------------------------------------------
#  # run various combinations of dropout1 and dropout2
#  tuning_run("mnist_mlp.R", runs_dir = "dropout_tuning", flags = list(
#    dropout1 = c(0.2, 0.3, 0.4),
#    dropout2 = c(0.2, 0.3, 0.4)
#  ))
#  
#  # list runs witin the specified runs_dir
#  ls_runs(order = eval_acc, runs_dir = "dropout_tuning")

## ------------------------------------------------------------------------
#  # run random sample (0.3) of dropout1 and dropout2 combinations
#  runs <- tuning_run("mnist_mlp.R", sample = 0.3, flags = list(
#    dropout1 = c(0.2, 0.3, 0.4),
#    dropout2 = c(0.2, 0.3, 0.4)
#  ))

