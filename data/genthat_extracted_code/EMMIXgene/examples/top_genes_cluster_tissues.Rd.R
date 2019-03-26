library(EMMIXgene)


### Name: top_genes_cluster_tissues
### Title: Cluster tissues
### Aliases: top_genes_cluster_tissues

### ** Examples

## No test: 
alon_sel <- select_genes(alon_data[seq_len(100), ])
## End(No test)
## No test: 
alon_top_10<-top_genes_cluster_tissues(alon_sel, 10, method='mfa', q=3, g=2)
## End(No test)



