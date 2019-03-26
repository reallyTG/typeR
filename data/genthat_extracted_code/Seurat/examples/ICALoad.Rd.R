library(Seurat)


### Name: ICALoad
### Title: ICA Gene Loadings Accessor Function
### Aliases: ICALoad

### ** Examples

pbmc_small
pbmc_small <- RunICA(pbmc_small, ics.compute = 10, ics.print = 0)
head(ICALoad(pbmc_small))
# Optionally, you can specify subsets of dims or cells to use
ICALoad(pbmc_small, dims.use = 1:5, genes.use = pbmc_small@var.genes[1:5])




