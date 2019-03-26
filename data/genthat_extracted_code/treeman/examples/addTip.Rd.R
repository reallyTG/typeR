library(treeman)


### Name: addTip
### Title: Add tip to a tree
### Aliases: addTip

### ** Examples

library(treeman)
tree <- randTree(10)
tree_age <- getAge(tree)
possible_ages <- getSpnAge(tree, 't1', tree_age)
start_age <- runif(1, possible_ages[['end']], possible_ages[['start']])
end_age <- possible_ages[['end']]
tree <- addTip(tree, tid='t11', sid='t1', strt_age=start_age,
end_age=end_age, tree_age=tree_age)
summary(tree)



