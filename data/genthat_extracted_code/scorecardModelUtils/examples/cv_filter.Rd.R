library(scorecardModelUtils)


### Name: cv_filter
### Title: Variable reduction based on Cramer's V filter
### Aliases: cv_filter

### ** Examples

data <- iris
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
cv_tab_list <- cv_table(data, c("Species", "Sepal.Length"))
cv_tab <- cv_tab_list$cv_val_tab
x <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
iv_table_list <- iv_table(base = data,target = "Y",num_var_name = x,cat_var_name = "Species")
iv_tab <- iv_table_list$iv_table
cv_filter_list <- cv_filter(cv_table = cv_tab,iv_table = iv_tab,threshold = 0.5)
cv_filter_list$retain_var_list
cv_filter_list$dropped_var_list
cv_filter_list$dropped_var_tab
cv_filter_list$threshold



