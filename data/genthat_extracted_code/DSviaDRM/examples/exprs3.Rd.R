library(DSviaDRM)


### Name: exprs3
### Title: Real dataset pulled down from GEO
###   (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE9006)
### Aliases: exprs3
### Keywords: datasets

### ** Examples

data(exprs3)
exprs3[,1:12] # exprssion data for Type 2 Diabetes samples
exprs3[,13:35] # exprssion data for health samples
row.names(exprs3) # gene identifiers



