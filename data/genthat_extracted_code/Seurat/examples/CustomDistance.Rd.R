library(Seurat)


### Name: CustomDistance
### Title: Run a custom distance function on an input data matrix
### Aliases: CustomDistance

### ** Examples

# Define custom distance matrix
manhattan.distance <- function(x, y) return(sum(abs(x-y)))

input.data <- GetAssayData(pbmc_small, assay.type = "RNA", slot = "scale.data")
cell.manhattan.dist <- CustomDistance(input.data, manhattan.distance)




