library(EMMIXgene)


### Name: cluster_tissues
### Title: Clusters tissues
### Aliases: cluster_tissues

### ** Examples

#only run on first 100 genes for speed
alon_sel <- select_genes(alon_data[seq_len(100), ]) 
alon_clust<- cluster_genes(alon_sel,2)
alon_tissue_t<-
   cluster_tissues(alon_sel,alon_clust,method='t')
alon_tissue_mfa<-
   cluster_tissues(alon_sel, alon_clust,method='mfa',q=2,G=2) 



