library(EMMIXgene)


### Name: cluster_genes
### Title: Clusters genes using mixtures of normal distributions
### Aliases: cluster_genes

### ** Examples


#only run on first 100 genes for speed
alon_sel <- select_genes(alon_data[seq_len(100), ]) 
alon_clust<- cluster_genes(alon_sel , 2)



