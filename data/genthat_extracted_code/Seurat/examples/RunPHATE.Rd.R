library(Seurat)


### Name: RunPHATE
### Title: Run PHATE
### Aliases: RunPHATE

### ** Examples

if (reticulate::py_module_available("phate")) {

# Load data
pbmc_small

# Run PHATE with default parameters
pbmc_small <- RunPHATE(object = pbmc_small)
# Plot results
DimPlot(object = pbmc_small, reduction.use = 'phate')

# Try smaller `k` for a small dataset, and larger `t` for a noisy embedding
pbmc_small <- RunPHATE(object = pbmc_small, k = 4, t = 12)
# Plot results
DimPlot(object = pbmc_small, reduction.use = 'phate')
1
# For increased emphasis on local structure, use sqrt potential (gamma=0)
pbmc_small <- RunPHATE(object = pbmc_small, gamma=0)
# Plot results
DimPlot(object = pbmc_small, reduction.use = 'phate')
}




