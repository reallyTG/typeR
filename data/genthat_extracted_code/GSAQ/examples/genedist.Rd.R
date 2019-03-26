library(GSAQ)


### Name: genedist
### Title: Chromosomal distribution of the genes in the selected geneset
### Aliases: genedist
### Keywords: gene geneset genelist

### ** Examples

data(rice_salt)
data(genelist)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
geneset= GeneSelect(x, y, s=50, method="t-score")$selectgenes
genelist=as.data.frame(genelist)
genedist(geneset, genelist, plot=TRUE)



