library(itree)


### Name: snip.itree
### Title: Snip Subtrees of an 'itree' Object
### Aliases: snip.itree
### Keywords: tree

### ** Examples

## dataset not in R
## same as rpart:
## Not run: 
##D z.survey <- itree(market.survey) #grow the itree object
##D plot(z.survey) #plot the tree
##D z.survey2 <- snip.itree(z.survey,toss=2) #trim subtree at node 2
##D plot(z.survey2) #plot new tree
##D 
##D # can also interactively select the node using the mouse in the
##D # graphics window
##D 
## End(Not run)
#works with itree fits as well:
z.auto <- itree(Mileage ~ Weight, method="purity",car.test.frame)
#snip off the long branch:
z.auto2 <- snip.itree(z.auto,toss=3)



