library(Seurat)


### Name: ICAEmbed
### Title: ICA Cell Embeddings Accessor Function
### Aliases: ICAEmbed

### ** Examples

pbmc_small
pbmc_small <- RunICA(pbmc_small, ics.compute = 10, ics.print = 0)
head(ICAEmbed(pbmc_small))
# Optionally, you can specify subsets of dims or cells to use
ICAEmbed(pbmc_small, dims.use = 1:5, cells.use = pbmc_small@cell.names[1:5])




