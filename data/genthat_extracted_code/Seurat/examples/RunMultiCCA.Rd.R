library(Seurat)


### Name: RunMultiCCA
### Title: Perform Canonical Correlation Analysis with more than two groups
### Aliases: RunMultiCCA

### ** Examples

## Not run: 
##D pbmc_small
##D # As multi-set CCA requires more than two datasets, we will split our test object into
##D # three just for this example
##D pbmc1 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[1:30])
##D pbmc2 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[31:60])
##D pbmc3 <- SubsetData(pbmc_small,cells.use = pbmc_small@cell.names[61:80])
##D pbmc1@meta.data$group <- "group1"
##D pbmc2@meta.data$group <- "group2"
##D pbmc3@meta.data$group <- "group3"
##D pbmc.list <- list(pbmc1, pbmc2, pbmc3)
##D pbmc_cca <- RunMultiCCA(object.list = pbmc.list, genes.use = pbmc_small@var.genes, num.ccs = 3)
##D # Print results
##D PrintDim(pbmc_cca,reduction.type = 'cca')
## End(Not run)




