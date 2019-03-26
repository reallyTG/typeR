library(Seurat)


### Name: RunCCA
### Title: Perform Canonical Correlation Analysis
### Aliases: RunCCA

### ** Examples

pbmc_small
# As CCA requires two datasets, we will split our test object into two just for this example
pbmc1 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[1:40])
pbmc2 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[41:80])
pbmc1@meta.data$group <- "group1"
pbmc2@meta.data$group <- "group2"
pbmc_cca <- RunCCA(pbmc1,pbmc2)
# Print results
PrintDim(pbmc_cca,reduction.type = 'cca')




