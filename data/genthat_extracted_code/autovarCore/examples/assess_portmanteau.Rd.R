library(autovarCore)


### Name: assess_portmanteau
### Title: Tests the white noise assumption for a VAR model using a
###   portmanteau test on the residuals
### Aliases: assess_portmanteau

### ** Examples

data_matrix <- matrix(nrow = 40, ncol = 3)
data_matrix[, ] <- runif(ncol(data_matrix) * nrow(data_matrix), 1, nrow(data_matrix))
colnames(data_matrix) <- c('rumination', 'happiness', 'activity')
varest <- autovarCore:::run_var(data_matrix, NULL, 1)
autovarCore:::assess_portmanteau(varest)



