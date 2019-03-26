library(arules)


### Name: itemsets-class
### Title: Class itemsets - A Set of Itemsets
### Aliases: itemsets-class itemsets summary.itemsets-class
###   show,summary.itemsets-method coerce,itemsets,data.frame-method
###   items,itemsets-method items<-,itemsets-method items items<-
###   itemInfo,itemsets-method itemLabels,itemsets-method
###   itemLabels<-,itemsets-method nitems,itemsets-method
###   labels,itemsets-method itemLabels,itemsets-method
###   summary,itemsets-method tidLists,itemsets-method
### Keywords: classes

### ** Examples

data("Adult")

## Mine frequent itemsets with Eclat.
fsets <- eclat(Adult, parameter = list(supp = 0.5))

## Display the 5 itemsets with the highest support.
fsets.top5 <- sort(fsets)[1:5]
inspect(fsets.top5)

## Get the itemsets as a list
as(items(fsets.top5), "list")

## Get the itemsets as a binary matrix
as(items(fsets.top5), "matrix")

## Get the itemsets as a sparse matrix, a ngCMatrix from package Matrix.
## Warning: for efficiency reasons, the ngCMatrix you get is transposed 
as(items(fsets.top5), "ngCMatrix")




