library(nlnet)


### Name: data.gen
### Title: Simulated Data Generation
### Aliases: data.gen

### ** Examples

##generating a gene matrix with 100 genes, some in 5 clusters, and 100 samples per gene.
output<-data.gen(n.genes=100, n.samples=10, n.grps=5)
##get the gene matrix from the source of data.
matrix<-output$data
##get the hiden clusters from the source of data.
grps<-output$grp



