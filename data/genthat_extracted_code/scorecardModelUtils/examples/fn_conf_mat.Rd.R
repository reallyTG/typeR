library(scorecardModelUtils)


### Name: fn_conf_mat
### Title: Creates confusion matrix and its related measures
### Aliases: fn_conf_mat

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
data$Y_pred <- sample(0:1,size=nrow(data),replace=TRUE)
fn_conf_mat_list <- fn_conf_mat(base = data,observed_col = "Y",predicted_col = "Y_pred",event = 1)
fn_conf_mat_list$confusion_mat
fn_conf_mat_list$accuracy
fn_conf_mat_list$precision
fn_conf_mat_list$recall
fn_conf_mat_list$sensitivity
fn_conf_mat_list$specificity
fn_conf_mat_list$f1_score



