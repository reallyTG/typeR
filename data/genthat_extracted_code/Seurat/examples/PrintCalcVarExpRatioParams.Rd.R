library(Seurat)


### Name: PrintCalcVarExpRatioParams
### Title: Print Parameters Associated with CalcVarExpRatio
### Aliases: PrintCalcVarExpRatioParams

### ** Examples

## Not run: 
##D # Requires CCA to have previously been run
##D # As CCA requires two datasets, we will split our test object into two just for this example
##D pbmc1 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[1:40])
##D pbmc2 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[41:80])
##D pbmc1@meta.data$group <- "group1"
##D pbmc2@meta.data$group <- "group2"
##D pbmc_cca <- RunCCA(pbmc1,pbmc2)
##D pbmc_cca <- CalcVarExpRatio(pbmc_cca,reduction.type = "pca", grouping.var = "group", dims.use = 1:5)
##D PrintCalcVarExpRatioParams(object = pbmc_cca)
## End(Not run)




