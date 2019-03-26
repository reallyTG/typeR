library(GSAQ)


### Name: GSVQ
### Title: Gene Set Validation with QTL using Hyper-geometric test without
###   gene sampling model
### Aliases: GSVQ
### Keywords: gene geneset genelist qtl

### ** Examples

data(rice_salt)
data(genelist)
data(qtl_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
geneset= GeneSelect(x, y, s=50, method="t-score")$selectgenes
genelist=as.data.frame(genelist)
qtl=as.data.frame(qtl_salt)
GSVQ(geneset, genelist, qtl)



