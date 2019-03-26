library(autovarCore)


### Name: invalid_mask
### Title: Calculate a bit mask to identify invalid outlier dummies
### Aliases: invalid_mask

### ** Examples

resid_matrix <- matrix(rnorm(39 * 3),
                       nrow = 39,
                       ncol = 3,
                       dimnames = list(NULL, c('rumination', 'happiness', 'activity')))
outlier_dummies <- autovarCore:::residual_outliers(resid_matrix, 40)
autovarCore:::invalid_mask(outlier_dummies)



