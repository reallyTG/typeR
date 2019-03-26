library(arules)


### Name: itemMatrix-class
### Title: Class itemMatrix - Sparse Binary Incidence Matrix to Represent
###   Sets of Items
### Aliases: itemMatrix-class itemMatrix initialize,itemMatrix-method
###   summary.itemMatrix-class show,summary.itemMatrix-method
###   print,summary.itemMatrix-method coerce,matrix,itemMatrix-method
###   coerce,list,itemMatrix-method coerce,itemMatrix,matrix-method
###   coerce,itemMatrix,ngCMatrix-method coerce,ngCMatrix,itemMatrix-method
###   coerce,itemMatrix,list-method dim,itemMatrix-method
###   dimnames,itemMatrix-method dimnames<-,itemMatrix,list-method
###   %in%,itemMatrix,character-method %in%,itemMatrix,itemMatrix-method
###   %pin%,itemMatrix,character-method %ain%,itemMatrix,character-method
###   %oin%,itemMatrix,character-method itemLabels<-,itemMatrix-method
###   itemLabels,itemMatrix-method itemLabels<- itemLabels
###   itemInfo<-,itemMatrix-method itemInfo,itemMatrix-method itemInfo<-
###   itemInfo itemsetInfo<-,itemMatrix-method
###   itemsetInfo,itemMatrix-method itemsetInfo<- itemsetInfo
###   labels,itemMatrix-method labels nitems nitems,itemMatrix-method
###   show,itemMatrix-method summary,itemMatrix-method t,ngCMatrix-method
###   plot.itemMatrix
### Keywords: classes

### ** Examples

set.seed(1234)
  
## Generate random data and coerce data to itemMatrix.
m <- matrix(runif(100000)>0.8, ncol=20)
dimnames(m) <- list(NULL, paste("item", c(1:20), sep=""))
i <- as(m, "itemMatrix")

## Get the number of elements (rows) in the itemMatrix.
length(i)

## Get first 5 elements (rows) of the itemMatrix as list.
as(i[1:5], "list")

## Get first 5 elements (rows) of the itemMatrix as matrix.
as(i[1:5], "matrix")

## Get first 5 elements (rows) of the itemMatrix as sparse ngCMatrix.
## Warning: for efficiency reasons, the ngCMatrix you get is transposed!
as(i[1:5], "ngCMatrix")

## Get labels for the first 5 itemsets (first default and then with 
## custom formating)
labels(i[1:5])
labels(i[1:5], itemSep = " + ", setStart = "", setEnd = "")

## create itemsets from itemMatrix  
is <- new("itemsets", items = i[1:3])
inspect(is)

## create rules (rhs and lhs cannot share items so I use 
## itemSetdiff here). Also assign (random) support.
rules <- new("rules", lhs=itemSetdiff(i[4:6],i[1:3]), rhs=i[1:3],
  quality = data.frame(support = runif(3)))
inspect(rules) 



