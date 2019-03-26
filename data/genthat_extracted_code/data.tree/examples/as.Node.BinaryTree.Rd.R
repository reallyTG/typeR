library(data.tree)


### Name: as.Node.BinaryTree
### Title: Convert a a 'SplitNode' from the party package to a 'data.tree'
###   structure.
### Aliases: as.Node.BinaryTree

### ** Examples

library(party)
airq <- subset(airquality, !is.na(Ozone))
airct <- ctree(Ozone ~ ., data = airq, 
               controls = ctree_control(maxsurrogate = 3))
               
tree <- as.Node(airct)
tree

print(tree, 
      "label", 
      criterion = function(x) round(x$criterion$maxcriterion, 3),
      statistic = function(x) round(max(x$criterion$statistic), 3)
      )

FindNode(tree, 6)$path





