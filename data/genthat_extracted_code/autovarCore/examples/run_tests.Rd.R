library(autovarCore)


### Name: run_tests
### Title: Execute a series of model validity assumptions
### Aliases: run_tests

### ** Examples

data_matrix <- matrix(nrow = 40, ncol = 3)
data_matrix[, ] <- runif(ncol(data_matrix) * nrow(data_matrix), 1, nrow(data_matrix))
colnames(data_matrix) <- c('rumination', 'happiness', 'activity')
varest <- autovarCore:::run_var(data_matrix, NULL, 1)
autovarCore:::run_tests(varest, 'portmanteau')



