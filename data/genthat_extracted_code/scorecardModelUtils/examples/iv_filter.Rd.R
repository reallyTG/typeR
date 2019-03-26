library(scorecardModelUtils)


### Name: iv_filter
### Title: Variable reduction based on Information Value filter
### Aliases: iv_filter

### ** Examples

data <- iris
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
x <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
iv_table_list <- iv_table(base = data,target = "Y",num_var_name = x,cat_var_name = "Species")
ivf_list <- iv_filter(base = data,iv_table = iv_table_list$iv_table,threshold = 0.02)
ivf_list$retain_var_tab
ivf_list$retain_var_name
ivf_list$dropped_var_tab
ivf_list$threshold



