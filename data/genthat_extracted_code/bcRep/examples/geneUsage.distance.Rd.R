library(bcRep)


### Name: geneUsage.distance
### Title: Dissimilarity/distance indices for gene usage data
### Aliases: geneUsage.distance

### ** Examples

data(vgenes) # VH gene proportions of 10 samples (rows) and 30 VH genes (columns)
disttab<-geneUsage.distance(geneUsage.tab = vgenes, method = "bc")




