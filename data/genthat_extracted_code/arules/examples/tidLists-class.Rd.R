library(arules)


### Name: tidLists-class
### Title: Class tidLists - Transaction ID Lists for Items/Itemsets
### Aliases: tidLists-class tidLists tidlists tidLists_or_NULL-class
###   initialize,tidLists-method coerce,tidLists,matrix-method
###   coerce,tidLists,list-method coerce,list,tidLists-method
###   coerce,tidLists,ngCMatrix-method coerce,tidLists,transactions-method
###   coerce,transactions,tidLists-method coerce,tidLists,itemMatrix-method
###   coerce,itemMatrix,tidLists-method dim,tidLists-method
###   dimnames,tidLists-method dimnames<-,tidLists,list-method
###   labels,tidLists-method itemLabels,tidLists-method
###   itemInfo,tidLists-method itemInfo<-,tidLists-method
###   inspect,tidLists-method transactionInfo,tidLists-method
###   transactionInfo<-,tidLists-method t,tidLists-method c,tidLists-method
###   show,tidLists-method summary,tidLists-method summary.tidLists-class
###   show,summary.tidLists-method
### Keywords: classes

### ** Examples

## Create transaction data set.
data <- list(
  c("a","b","c"),
  c("a","b"),
  c("a","b","d"),
  c("b","e"),
  c("b","c","e"),
  c("a","d","e"),
  c("a","c"),
  c("a","b","d"),
  c("c","e"),
  c("a","b","d","e")
  )
data <- as(data, "transactions")
data

## convert transactions to transaction ID lists
tl <- as(data, "tidLists")
tl 

inspect(tl)
dim(tl)
dimnames(tl)

## inspect visually
image(tl)

## mine itemsets with transaction ID lists
f <- eclat(data, parameter = list(support = 0, tidLists = TRUE))
tl2 <- tidLists(f)
inspect(tl2)



