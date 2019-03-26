library(scorecardModelUtils)


### Name: vif_filter
### Title: Removing multicollinearity from a model using vif test
### Aliases: vif_filter

### ** Examples

data <- iris
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
vif_data_list <- vif_filter(base = data,target = "Y")
vif_data_list$vif_table
vif_data_list$model
vif_data_list$retain_var_list
vif_data_list$dropped_var_list
vif_data_list$threshold



