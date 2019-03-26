library(Seurat)


### Name: CalcAlignmentMetric
### Title: Calculate an alignment score
### Aliases: CalcAlignmentMetric

### ** Examples

## Not run: 
##D pbmc_small
##D # As CCA requires two datasets, we will split our test object into two just for this example
##D pbmc1 <- SubsetData(pbmc_small, cells.use = pbmc_small@cell.names[1:40])
##D pbmc2 <- SubsetData(pbmc_small, cells.use = pbmc_small@cell.names[41:80])
##D pbmc1@meta.data$group <- "group1"
##D pbmc2@meta.data$group <- "group2"
##D pbmc_cca <- RunCCA(pbmc1,pbmc2)
##D pbmc_cca <- AlignSubspace(pbmc_cca, reduction.type = "cca",
##D                           grouping.var = "group", dims.align = 1:5)
##D CalcAlignmentMetric(pbmc_cca, reduction.use = "cca.aligned",
##D                     dims.use = 1:5, grouping.var =  "group")
## End(Not run)




