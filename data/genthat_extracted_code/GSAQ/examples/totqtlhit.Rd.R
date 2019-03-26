library(GSAQ)


### Name: totqtlhit
### Title: Computation of total number of qtl-hits found in the whole gene
###   space
### Aliases: totqtlhit
### Keywords: genelist qtl qtlhit

### ** Examples

data(genelist)
data(qtl_salt)
genelist=as.data.frame(genelist)
qtl=as.data.frame(qtl_salt)
totqtlhit(genelist, qtl)



