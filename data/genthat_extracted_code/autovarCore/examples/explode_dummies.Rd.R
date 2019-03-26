library(autovarCore)


### Name: explode_dummies
### Title: Explode dummies columns into separate dummy variables
### Aliases: explode_dummies

### ** Examples

outlier_dummies <- matrix(NA,
                          nrow = 5,
                          ncol = 3,
                         dimnames = list(NULL, c('rumination', 'happiness', 'activity')))
outlier_dummies[, 1] <- c(0, 0, 1, 0, 1)
outlier_dummies[, 2] <- c(0, 1, 1, 0, 0)
outlier_dummies[, 3] <- c(1, 0, 0, 0, 1)
outlier_dummies
autovarCore:::explode_dummies(outlier_dummies)



