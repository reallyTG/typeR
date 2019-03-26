library(ruta)


### Name: evaluate_mean_squared_error
### Title: Evaluation metrics
### Aliases: evaluate_mean_squared_error evaluate_mean_absolute_error
###   evaluate_binary_crossentropy evaluate_binary_accuracy
###   evaluate_kullback_leibler_divergence

### ** Examples

library(purrr)

x <- as.matrix(sample(iris[, 1:4]))
x_train <- x[1:100, ]
x_test <- x[101:150, ]

## No test: 
autoencoder(2) %>%
  train(x_train) %>%
  evaluate_mean_squared_error(x_test)
## End(No test)




