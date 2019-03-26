library(scorecardModelUtils)


### Name: iv_table
### Title: WOE and IV table for list of numerical and categorical variables
### Aliases: iv_table

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
x <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
iv_table_list <- iv_table(base = data,target = "Y",num_var_name = x,cat_var_name = "Species")
iv_table_list$num_woe_table
iv_table_list$cat_woe_table
iv_table_list$woe_table
iv_table_list$iv_table



