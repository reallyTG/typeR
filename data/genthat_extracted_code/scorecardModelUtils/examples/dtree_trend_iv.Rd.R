library(scorecardModelUtils)


### Name: dtree_trend_iv
### Title: Recursive Decision Tree partitioning with monotonic event rate
###   along with IV table for individual numerical variable
### Aliases: dtree_trend_iv

### ** Examples

data <- iris
data$Y <- ifelse(data$Species=="setosa",1,0)
dtree_trend_tab <- dtree_trend_iv(base = data,target = "Y",variable = "Sepal.Length",event = 1)



