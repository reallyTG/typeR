library(GSAQ)


### Name: geneqtl
### Title: List of the selected genes along with their corresponding
###   overlapped QTL
### Aliases: geneqtl
### Keywords: gene geneset genelist QTL

### ** Examples

data(rice_salt)
data(genelist)
data(qtl_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
genelist=as.data.frame(genelist)
qtl=as.data.frame(qtl_salt)
geneset= GeneSelect(x, y, s=50, method="t-score")$selectgenes
geneqtl(geneset, genelist, qtl)




