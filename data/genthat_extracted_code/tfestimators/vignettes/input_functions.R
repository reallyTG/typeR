## ----setup, include=FALSE------------------------------------------------
# # https://www.tensorflow.org/get_started/input_fn
library(tfestimators)
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  model %>% train(
#    input_fn(mtcars,
#             features = c(drat, cyl),
#             response = mpg,
#             batch_size = 128,
#             epochs = 3)
#  )

## ------------------------------------------------------------------------
#  model %>% train(
#    input_fn(mpg ~ drat + cyl,
#             data = mtcars,
#             batch_size = 128,
#             epochs = 3)
#  )

## ------------------------------------------------------------------------
#  mtcars_input_fn <- function(data, ...) {
#    input_fn(data,
#             features = c("drat", "cyl"),
#             response = "mpg",
#             ...)
#  }

## ------------------------------------------------------------------------
#  # train the model
#  model %>% train(mtcars_input_fn(train_data))
#  
#  # evaluate the model
#  model %>% evaluate(mtcars_input_fn(test_data))

## ------------------------------------------------------------------------
#  m <- matrix(c(1:12), nrow = 4, ncol = 3)
#  colnames(m) <- c("x1", "x2", "y")
#  input_fn(m, features = c("x1", "x2"), response = "y")

## ------------------------------------------------------------------------
#  input_fn(
#    object = list(
#      inputs = list(
#        list(list(1), list(2), list(3)),
#        list(list(4), list(5), list(6))),
#      output = list(
#        list(1, 2, 3), list(4, 5, 6))),
#    features = "inputs",
#    response = "output"
#  )

