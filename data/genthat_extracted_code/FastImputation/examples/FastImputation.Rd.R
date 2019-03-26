library(FastImputation)


### Name: FastImputation
### Title: Use the pattern learned from the training data to impute (fill
###   in good guesses for) missing values.
### Aliases: FastImputation

### ** Examples

data(FI_train)   # provides FItrain dataset
patterns <- TrainFastImputation(
  FI_train,
  constraints=list(list("bounded_below_2", list(lower=0)),
                   list("bounded_above_5", list(upper=0)),
                   list("bounded_above_and_below_6", list(lower=0, upper=1))
                   ),
  idvars="user_id_1",
  categorical="categorical_9")

data(FI_test)
FI_test          # note there is missing data
imputed_data <- FastImputation(FI_test, patterns)
imputed_data    # good guesses for missing values are filled in

data(FI_true)
continuous_cells_imputed <- is.na(FI_test[,2:8])
continuous_imputed_values <- imputed_data[,2:8][continuous_cells_imputed]
continuous_true_values <- FI_true[,2:8][continuous_cells_imputed]
rmse <- sqrt(median((continuous_imputed_values-continuous_true_values)^2))
rmse
median_relative_error <- median( abs((continuous_imputed_values - continuous_true_values) / 
  continuous_true_values) )
median_relative_error

imputed_data_column_means <- FI_test[,2:8]
for(j in 1:ncol(imputed_data_column_means)) {
  imputed_data_column_means[is.na(imputed_data_column_means[,j]),j] <- 
    mean(imputed_data_column_means[,j], na.rm=TRUE)
}
cont_imputed_vals_col_means <- imputed_data_column_means[continuous_cells_imputed]
rmse_column_means <- sqrt(median((cont_imputed_vals_col_means-continuous_true_values)^2))
rmse_column_means  # much larger error than using FastImputation
median_relative_error_col_means <- median( abs((cont_imputed_vals_col_means - 
  continuous_true_values) / continuous_true_values) )
median_relative_error_col_means  # larger error than using FastImputation

# Let's look at the accuracy of the imputation of the categorical variable
library("caret")
categorical_rows_imputed <- which(is.na(FI_test$categorical_9))
confusionMatrix(data=imputed_data$categorical_9[categorical_rows_imputed], 
                reference=FI_true$categorical_9[categorical_rows_imputed])
# Compare to imputing with the modal value
stat_mode <- function(x) {
  unique_values <- unique(x)
  unique_values <- unique_values[!is.na(unique_values)]
  unique_values[which.max(tabulate(match(x, unique_values)))]
}
categorical_rows_imputed_col_mode <- rep(stat_mode(FI_test$categorical_9), 
                                         length(categorical_rows_imputed))
confusionMatrix(data=categorical_rows_imputed_col_mode, 
                reference=FI_true$categorical_9[categorical_rows_imputed])
# less accurate than using FastImputation




