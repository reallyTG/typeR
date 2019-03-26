library(Seurat)


### Name: PrintICA
### Title: Print the results of a ICA analysis
### Aliases: PrintICA

### ** Examples

pbmc_small
pbmc_small <- RunICA(object = pbmc_small, ics.compute = 10, ics.print = 0)
pbmc_small <- ProjectDim(object = pbmc_small, reduction.type = "ica", do.print = FALSE)
PrintICA(object = pbmc_small)
# Options for how many dimensions and how many genes to print
PrintICA(object = pbmc_small, ics.print = 1:2, genes.print = 5)
# Can also print for the projected PCA
PrintICA(object = pbmc_small, use.full = TRUE)




