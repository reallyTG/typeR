library(parsnip)


### Name: decision_tree
### Title: General Interface for Decision Tree Models
### Aliases: decision_tree update.decision_tree

### ** Examples

decision_tree(mode = "classification", tree_depth = 5)
# Parameters can be represented by a placeholder:
decision_tree(mode = "regression", cost_complexity = varying())
model <- decision_tree(cost_complexity = 10, min_n = 3)
model
update(model, cost_complexity = 1)
update(model, cost_complexity = 1, fresh = TRUE)



