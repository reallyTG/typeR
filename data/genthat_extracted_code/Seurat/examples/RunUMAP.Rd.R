library(Seurat)


### Name: RunUMAP
### Title: Run UMAP
### Aliases: RunUMAP

### ** Examples

## Not run: 
##D pbmc_small
##D # Run UMAP map on first 5 PCs
##D pbmc_small <- RunUMAP(object = pbmc_small, dims.use = 1:5)
##D # Plot results
##D DimPlot(object = pbmc_small, reduction.use = 'umap')
## End(Not run)




