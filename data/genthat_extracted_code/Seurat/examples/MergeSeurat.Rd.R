library(Seurat)


### Name: MergeSeurat
### Title: Merge Seurat Objects
### Aliases: MergeSeurat

### ** Examples

# Split pbmc_small for this example
pbmc1 <- SubsetData(object = pbmc_small, cells.use = pbmc_small@cell.names[1:40])
pbmc1
pbmc2 <- SubsetData(object = pbmc_small, cells.use = pbmc_small@cell.names[41:80])
pbmc2
# Merge pbmc1 and pbmc2 into one Seurat object
pbmc_merged <- MergeSeurat(object1 = pbmc1, object2 = pbmc2)
pbmc_merged




