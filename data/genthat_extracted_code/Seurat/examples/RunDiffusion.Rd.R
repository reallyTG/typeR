library(Seurat)


### Name: RunDiffusion
### Title: Run diffusion map
### Aliases: RunDiffusion

### ** Examples

## Not run: 
##D pbmc_small
##D # Run Diffusion on variable genes
##D pbmc_small <- RunDiffusion(pbmc_small,genes.use = pbmc_small@var.genes)
##D # Run Diffusion map on first 10 PCs
##D pbmc_small <- RunDiffusion(pbmc_small,genes.use = pbmc_small@var.genes)
##D # Plot results
##D DMPlot(pbmc_small)
## End(Not run)




