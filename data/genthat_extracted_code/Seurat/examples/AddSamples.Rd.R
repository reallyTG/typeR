library(Seurat)


### Name: AddSamples
### Title: Add samples into existing Seurat object.
### Aliases: AddSamples

### ** Examples

pbmc1 <- SubsetData(object = pbmc_small, cells.use = pbmc_small@cell.names[1:40])
pbmc1
pbmc2 <- SubsetData(object = pbmc_small, cells.use = pbmc_small@cell.names[41:80])
pbmc2_data <- pbmc2@data
dim(pbmc2_data)
pbmc_added <- AddSamples(object = pbmc1, new.data = pbmc2_data)
pbmc_added




