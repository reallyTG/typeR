library(Seurat)


### Name: PrintPCA
### Title: Print the results of a PCA analysis
### Aliases: PrintPCA

### ** Examples

pbmc_small
PrintPCA(object = pbmc_small)
# Options for how many dimensions and how many genes to print
PrintPCA(object = pbmc_small, pcs.print = 1:2, genes.print = 5)
# Can also print for the projected PCA
PrintPCA(object = pbmc_small, use.full = TRUE)




