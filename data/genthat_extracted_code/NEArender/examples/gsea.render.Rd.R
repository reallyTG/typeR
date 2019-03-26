library(NEArender)


### Name: gsea.render
### Title: Gene Set Enrichment Analysis (GSEA)
### Aliases: gsea.render
### Keywords: AGS FGS

### ** Examples

ags.list <- samples2ags(fantom5.43samples, Ntop=20, method="topnorm")
data(can.sig.go)
fpath <- can.sig.go
fgs.list <- import.gs(fpath)
g1 <- gsea.render(AGS=ags.list, FGS=fgs.list, Lowercase = 1, 
ags.gene.col = 2, ags.group.col = 3, fgs.gene.col = 2, fgs.group.col = 3, 
echo=1, Ntotal = 20000, Parallelize=1)
hist(g1$estimate, breaks=100)
hist(g1$n, breaks=100)
hist(g1$p, breaks=100)
hist(g1$q, breaks=100)



