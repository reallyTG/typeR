library(treeman)


### Name: getSpnsAge
### Title: Get age ranges for multiple nodes
### Aliases: getSpnsAge

### ** Examples

library(treeman)
tree <- randTree(10)
# all nodes but root
ids <- tree['nds'][tree['nds'] != tree['root']]
getSpnsAge(tree, ids=ids, tree_age=getAge(tree))



