library(Seurat)


### Name: RunPCA
### Title: Run Principal Component Analysis on gene expression using IRLBA
### Aliases: RunPCA

### ** Examples

pbmc_small
# Run PCA on variable genes (default)
pbmc_small <- RunPCA(pbmc_small)
# Run PCA on different gene set (in this case all genes)
pbmc_small=RunPCA(pbmc_small,pc.genes = rownames(pbmc_small@data))
# Run PCA but compute more than 20 dimensions
pbmc_small=RunPCA(pbmc_small,pcs.compute=30)
# Plot results
PCAPlot(pbmc_small)




