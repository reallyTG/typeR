library(autovarCore)


### Name: validate_params
### Title: Validates the params given to the autovar function
### Aliases: validate_params

### ** Examples

data_matrix <- matrix(ncol = 3, nrow = 5)
data_matrix[, 1] <- 1
data_matrix[, 2] <- c(1, 3, 5, 6, 7)
data_matrix[, 3] <- c(1, 0, 1, NA, 1)
colnames(data_matrix) <- c('id', 'tijdstip', 'home')
autovarCore:::validate_params(data_matrix,
                              list(selected_column_names = c('tijdstip', 'home'),
                                   imputation_iterations = 20))



