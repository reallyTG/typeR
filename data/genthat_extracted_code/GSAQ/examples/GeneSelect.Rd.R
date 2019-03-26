library(GSAQ)


### Name: GeneSelect
### Title: Selection of informative geneset
### Aliases: GeneSelect
### Keywords: gene geneset gene expression data method

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
GeneSelect(x, y, s=50, method="t-score")$selectgenes



