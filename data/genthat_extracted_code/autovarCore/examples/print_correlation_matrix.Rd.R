library(autovarCore)


### Name: print_correlation_matrix
### Title: Print the correlation matrix of the residuals of a model
###   annotated with p-values
### Aliases: print_correlation_matrix

### ** Examples

data_matrix <- matrix(nrow = 40, ncol = 3)
data_matrix[, ] <- runif(ncol(data_matrix) * nrow(data_matrix), 1, nrow(data_matrix))
colnames(data_matrix) <- c('rumination', 'happiness', 'activity')
varest <- autovarCore:::run_var(data_matrix, NULL, 1)
autovarCore::print_correlation_matrix(varest)



