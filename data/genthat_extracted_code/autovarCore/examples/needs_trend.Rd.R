library(autovarCore)


### Name: needs_trend
### Title: Determines if a trend is required for the specified VAR model
### Aliases: needs_trend

### ** Examples

data_matrix <- matrix(nrow = 40, ncol = 3)
data_matrix[, ] <- runif(ncol(data_matrix) * nrow(data_matrix), 1, 10)
data_matrix[, 3] <- (1:40) + rnorm(40)
colnames(data_matrix) <- c('rumination', 'happiness', 'activity')
data_matrix
autovarCore:::needs_trend(data_matrix, 1)



