library(Seurat)


### Name: RunICA
### Title: Run Independent Component Analysis on gene expression
### Aliases: RunICA

### ** Examples

pbmc_small
# Run ICA on variable genes (default)
pbmc_small <- RunICA(pbmc_small, ics.compute=5)
# Run ICA on different gene set (in this case all genes)
pbmc_small <- RunICA(pbmc_small, ic.genes = rownames(pbmc_small@data))
# Plot results
ICAPlot(pbmc_small)




