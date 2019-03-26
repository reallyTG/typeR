library(scorecardModelUtils)


### Name: fn_cross_index
### Title: Creates random index for k-fold cross validation
### Aliases: fn_cross_index

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
data$Y_pred <- sample(0:1,size=nrow(data),replace=TRUE)
data_k_list <- fn_cross_index(base = data,k = 5)
data_k_list$index1
data_k_list$index2
data_k_list$index3
data_k_list$index4
data_k_list$index5



