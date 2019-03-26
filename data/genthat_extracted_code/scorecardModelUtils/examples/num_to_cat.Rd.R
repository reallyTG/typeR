library(scorecardModelUtils)


### Name: num_to_cat
### Title: Binning numerical variables based on cuts from IV table
### Aliases: num_to_cat

### ** Examples

data <- iris
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
x <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
iv_table_list <- iv_table(base = data,target = "Y",num_var_name = x,cat_var_name = "Species")
num_cat <- num_to_cat(base = data,num_woe_table = iv_table_list$num_woe_table)



