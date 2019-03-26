library(autovarCore)


### Name: autovar
### Title: Return the best VAR models found for a time series data set
### Aliases: autovar

### ** Examples

## Not run: 
##D data_matrix <- matrix(nrow = 40, ncol = 3)
##D data_matrix[, ] <- runif(ncol(data_matrix) * nrow(data_matrix), 1, nrow(data_matrix))
##D while (sum(is.na(data_matrix)) == 0)
##D   data_matrix[as.logical(round(runif(ncol(data_matrix) * nrow(data_matrix), -0.3, 0.7)))] <- NA
##D colnames(data_matrix) <- c('rumination', 'happiness', 'activity')
##D dataframe <- as.data.frame(data_matrix)
##D autovar(dataframe, selected_column_names = c('rumination', 'happiness'),
##D                    significance_levels = c(0.05, 0.01, 0.005),
##D                    test_names = c('portmanteau',
##D                                   'portmanteau_squared',
##D                                   'skewness'),
##D                    criterion = 'AIC',
##D                    imputation_iterations = 100,
##D                    measurements_per_day = 1)
## End(Not run)



