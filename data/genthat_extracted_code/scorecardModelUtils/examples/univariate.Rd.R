library(scorecardModelUtils)


### Name: univariate
### Title: Univariate analysis of variables
### Aliases: univariate

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)

univariate_list <- univariate(base = data,target = "Y",threshold = 0.95)
univariate_list$univar_table
univariate_list$num_var_name
univariate_list$char_var_name
univariate_list$sparse_var_name



