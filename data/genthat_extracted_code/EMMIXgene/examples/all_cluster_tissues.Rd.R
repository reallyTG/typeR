library(EMMIXgene)


### Name: all_cluster_tissues
### Title: Clusters tissues using all group means
### Aliases: all_cluster_tissues

### ** Examples


example <- plot_single_gene(alon_data,1) 
#only run on first 100 genes for speed
alon_sel <- select_genes(alon_data[seq_len(100), ]) 
alon_clust<- cluster_genes(alon_sel , 2)
## No test: 
alon_tissue_all<-all_cluster_tissues(alon_sel, alon_clust, q=1, G=2)
## End(No test)



