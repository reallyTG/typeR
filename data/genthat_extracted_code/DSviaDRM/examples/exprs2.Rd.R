library(DSviaDRM)


### Name: exprs2
### Title: Real dataset pulled down from GEO
###   (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE35487)
### Aliases: exprs2
### Keywords: datasets

### ** Examples

data(exprs2)
exprs2[,1:25] # exprssion data for Chronic kidney disease samples
exprs2[,26:31] # exprssion data for health samples
row.names(exprs2) # gene identifiers



