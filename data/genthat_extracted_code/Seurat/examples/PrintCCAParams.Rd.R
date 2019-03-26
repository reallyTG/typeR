library(Seurat)


### Name: PrintCCAParams
### Title: Print CCA Calculation Parameters
### Aliases: PrintCCAParams

### ** Examples

# As CCA requires two datasets, we will split our test object into two just for this example
pbmc1 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[1:40])
pbmc2 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[41:80])
pbmc1@meta.data$group <- "group1"
pbmc2@meta.data$group <- "group2"
pbmc_cca <- RunCCA(pbmc1,pbmc2)
PrintCCAParams(object = pbmc_cca)




