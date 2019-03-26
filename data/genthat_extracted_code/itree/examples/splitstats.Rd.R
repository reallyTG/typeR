library(itree)


### Name: splitstats
### Title: Stats about a tree's splits.
### Aliases: splitstats
### Keywords: tree

### ** Examples

require(mlbench); data(BostonHousing)
#fit a tree:
cart <- itree(medv~.,BostonHousing,minsplit=25,minbucket=25,cp=0)
splitstats(cart)



