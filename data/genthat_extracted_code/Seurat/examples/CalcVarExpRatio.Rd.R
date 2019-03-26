library(Seurat)


### Name: CalcVarExpRatio
### Title: Calculate the ratio of variance explained by ICA or PCA to CCA
### Aliases: CalcVarExpRatio

### ** Examples

pbmc_small
# Requires CCA to have previously been run
# As CCA requires two datasets, we will split our test object into two just for this example
pbmc1 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[1:40])
pbmc2 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[41:80])
pbmc1@meta.data$group <- "group1"
pbmc2@meta.data$group <- "group2"
pbmc_cca <- RunCCA(pbmc1,pbmc2)
pbmc_cca <- CalcVarExpRatio(pbmc_cca,reduction.type = "pca", grouping.var = "group", dims.use = 1:5)




