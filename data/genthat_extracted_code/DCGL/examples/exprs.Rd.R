library(DCGL)


### Name: exprs
### Title: Real dataset pulled down from GEO
###   (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE17967)
### Aliases: exprs
### Keywords: datasets

### ** Examples

data(exprs)
exprs[,1:16] # exprssion data for condition A
exprs[,17:63] # exprssion data for condition B
row.names(exprs) # gene identifier



