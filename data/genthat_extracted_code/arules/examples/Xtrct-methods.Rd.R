library(arules)


### Name: [-methods
### Title: Methods for "[": Extraction or Subsetting in Package 'arules'
### Aliases: [-methods [,rules,ANY,ANY,ANY-method
###   [,itemsets,ANY,ANY,ANY-method [,transactions,ANY,ANY,ANY-method
###   [,itemMatrix,ANY,ANY,ANY-method [,tidLists,ANY,ANY,ANY-method
###   [,rules-method [,itemsets-method [,transactions-method
###   [,itemMatrix-method [,tidLists-method [,Matrix,ANY,ANY,ANY-method
###   [<-,Matrix,ANY,ANY,ANY-method [<-,Matrix,missing,missing,ANY-method
###   [,Matrix,lMatrix,missing,ANY-method
###   [,Matrix,logical,missing,ANY-method
### Keywords: array

### ** Examples

data(Adult)
Adult

## select first 10 transactions
Adult[1:10]

## select first 10 items for first 100 transactions
Adult[1:100, 1:10]

## select the first 100 transactions for the items containing
## "income" or "age=Young" in their labels 
Adult[1:100, c("income=small", "income=large" ,"age=Young")]



