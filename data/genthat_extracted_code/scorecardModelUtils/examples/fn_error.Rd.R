library(scorecardModelUtils)


### Name: fn_error
### Title: Computes error measures between observed and predicted values
### Aliases: fn_error

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
data$Y_pred <- sample(0:1,size=nrow(data),replace=TRUE)
fn_error_list <- fn_error(base = data,observed_col = "Y",predicted_col = "Y_pred")
fn_error_list$mean_abs_error
fn_error_list$mean_sq_error
fn_error_list$root_mean_sq_error



