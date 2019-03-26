library(parsnip)


### Name: boost_tree
### Title: General Interface for Boosted Trees
### Aliases: boost_tree update.boost_tree

### ** Examples

boost_tree(mode = "classification", trees = 20)
# Parameters can be represented by a placeholder:
boost_tree(mode = "regression", mtry = varying())
model <- boost_tree(mtry = 10, min_n = 3)
model
update(model, mtry = 1)
update(model, mtry = 1, fresh = TRUE)



