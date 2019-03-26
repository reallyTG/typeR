library(autovarCore)


### Name: residual_outliers
### Title: Calculate dummy variables to mask residual outliers
### Aliases: residual_outliers

### ** Examples

resid_matrix <- matrix(rnorm(39 * 3),
                       nrow = 39,
                       ncol = 3,
                       dimnames = list(NULL, c('rumination', 'happiness', 'activity')))
resid_matrix[13, 2] <- 48
resid_matrix[23, 2] <- -62
resid_matrix[36, 2] <- 33
resid_matrix[27, 3] <- 75
resid_matrix
autovarCore:::residual_outliers(resid_matrix, 40)



