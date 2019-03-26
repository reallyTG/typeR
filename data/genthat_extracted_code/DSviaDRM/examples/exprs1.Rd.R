library(DSviaDRM)


### Name: exprs1
### Title: Real dataset pulled down from GEO
###   (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE22528)
### Aliases: exprs1
### Keywords: datasets

### ** Examples

data(exprs1)
exprs1[,1:5] # exprssion data for Allergic Asthma samples
exprs1[,6:10] # exprssion data for health samples
row.names(exprs1) # gene identifiers



