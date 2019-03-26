library(scorecardModelUtils)


### Name: dtree_split_val
### Title: Getting the split value for terminal nodes from decision tree
### Aliases: dtree_split_val

### ** Examples

data <- iris
data$Y <- ifelse(data$Species=="setosa",1,0)



