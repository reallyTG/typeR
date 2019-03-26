library(autovarCore)


### Name: assess_joint_sktest
### Title: Tests the skewness and kurtosis of a VAR model
### Aliases: assess_joint_sktest

### ** Examples

data_matrix <- matrix(nrow = 40, ncol = 3)
data_matrix[, ] <- runif(ncol(data_matrix) * nrow(data_matrix), 1, nrow(data_matrix))
colnames(data_matrix) <- c('rumination', 'happiness', 'activity')
varest <- autovarCore:::run_var(data_matrix, NULL, 1)
autovarCore:::assess_joint_sktest(varest)



