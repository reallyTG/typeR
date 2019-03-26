## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  fcs <- feature_columns(column_numeric("drat"))
#  input <- input_fn(mtcars, response = "mpg", features = c("drat", "cyl"), batch_size = 8L)
#  lr <- linear_regressor(
#    feature_columns = fcs
#  ) %>% train(
#    input_fn = input,
#    steps = 2,
#    hooks = list(
#      hook_progress_bar()
#    ))

## ----eval=FALSE----------------------------------------------------------
#  lr <- linear_regressor(feature_columns = fcs)
#  training_history <- train(
#    lr,
#    input_fn = input,
#    steps = 4,
#    hooks = list(
#      hook_history_saver(every_n_step = 2)
#    ))

## ----eval=FALSE----------------------------------------------------------
#  mean_losses_history <<- NULL
#  hook_history_saver_custom <- function(every_n_step) {
#  
#      iter_count <<- 0
#  
#      session_run_hook(
#  
#        before_run = function(context) {
#          session_run_args(
#            losses = context$session$graph$get_collection("losses")
#          )
#        },
#  
#        after_run = function(context, values) {
#          iter_count <<- iter_count + 1
#          print(paste0("Running step: ", iter_count))
#          if (iter_count %% every_n_step == 0) {
#            raw_losses <- values$results$losses[[1]]
#            mean_losses_history <<- c(mean_losses_history, mean(raw_losses))
#          }
#        }
#      )
#  }

## ----eval=FALSE----------------------------------------------------------
#  lr <- linear_regressor(
#    feature_columns = fcs
#  ) %>% train(
#    input_fn = input,
#    steps = 4,
#    hooks = list(
#      hook_history_saver_custom(every_n_step = 1)
#    ))

