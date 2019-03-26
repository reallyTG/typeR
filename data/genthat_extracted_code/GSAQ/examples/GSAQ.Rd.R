library(GSAQ)


### Name: GSAQ
### Title: Gene Set Analysis with Quantitative Trait Loci with gene
###   sampling model
### Aliases: GSAQ
### Keywords: gene geneset genelist qtl p value gene sampling model

### ** Examples

data(rice_salt)
data(genelist)
data(qtl_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
genelist=as.data.frame(genelist)
qtl=as.data.frame(qtl_salt)
geneset= GeneSelect(x, y, s=50, method="t-score")$selectgenes
GSAQ(geneset, genelist, qtl, SampleSize=30, K=50, method="meanp")



