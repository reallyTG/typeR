library(Seurat)


### Name: RunTSNE
### Title: Run t-distributed Stochastic Neighbor Embedding
### Aliases: RunTSNE

### ** Examples

pbmc_small
# Run tSNE on first five PCs, note that for test dataset (only 80 cells)
# we can't use default perplexity of 30
pbmc_small <- RunTSNE(pbmc_small, reduction.use = "pca", dims.use = 1:5, perplexity=10)
# Run tSNE on first five independent components from ICA
pbmc_small <- RunICA(pbmc_small,ics.compute=5)
pbmc_small <- RunTSNE(pbmc_small, reduction.use = "ica", dims.use = 1:5, perplexity=10)
# Plot results
TSNEPlot(pbmc_small)




