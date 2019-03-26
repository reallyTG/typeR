library(arules)


### Name: itemSetOperations
### Title: Itemwise Set Operations
### Aliases: itemSetOperations itemUnion
###   itemUnion,itemMatrix,itemMatrix-method itemSetdiff
###   itemSetdiff,itemMatrix,itemMatrix-method itemIntersect
###   itemIntersect,itemMatrix,itemMatrix-method
### Keywords: manip

### ** Examples

data("Adult")

fsets <- eclat(Adult, parameter = list(supp = 0.5))
inspect(fsets[1:4])
inspect(itemUnion(items(fsets[1:2]), items(fsets[3:4])))
inspect(itemSetdiff(items(fsets[1:2]), items(fsets[3:4])))
inspect(itemIntersect(items(fsets[1:2]), items(fsets[3:4])))



