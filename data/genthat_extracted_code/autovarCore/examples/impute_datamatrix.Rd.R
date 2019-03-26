library(autovarCore)


### Name: impute_datamatrix
### Title: Imputes the missing values in the input data
### Aliases: impute_datamatrix

### ** Examples

# create a matrix with some missing values
data_matrix <- matrix(nrow = 40, ncol = 3)
data_matrix[, ] <- runif(ncol(data_matrix) * nrow(data_matrix), 1, nrow(data_matrix))
while (sum(is.na(data_matrix)) == 0)
  data_matrix[as.logical(round(runif(ncol(data_matrix) * nrow(data_matrix), -0.3, 0.7)))] <- NA
colnames(data_matrix) <- c('rumination', 'happiness', 'activity')
data_matrix
autovarCore:::impute_datamatrix(data_matrix, 1, 100)



