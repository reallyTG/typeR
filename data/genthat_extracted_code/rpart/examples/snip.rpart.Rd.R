library(rpart)


### Name: snip.rpart
### Title: Snip Subtrees of an Rpart Object
### Aliases: snip.rpart
### Keywords: tree

### ** Examples

## dataset not in R
## Not run: 
##D z.survey <- rpart(market.survey) # grow the rpart object
##D plot(z.survey) # plot the tree
##D z.survey2 <- snip.rpart(z.survey, toss = 2) # trim subtree at node 2
##D plot(z.survey2) # plot new tree
##D 
##D # can also interactively select the node using the mouse in the
##D # graphics window
## End(Not run)


