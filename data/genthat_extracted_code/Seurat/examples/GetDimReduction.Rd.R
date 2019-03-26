library(Seurat)


### Name: GetDimReduction
### Title: Dimensional Reduction Accessor Function
### Aliases: GetDimReduction

### ** Examples

pbmc_small
# Get the PCA cell embeddings and print the top left corner
GetDimReduction(object = pbmc_small, reduction.type = "pca",
                slot = "cell.embeddings")[1:5, 1:5]
# Get the standard deviation of each PC
GetDimReduction(object = pbmc_small, reduction.type = "pca", slot = "sdev")




