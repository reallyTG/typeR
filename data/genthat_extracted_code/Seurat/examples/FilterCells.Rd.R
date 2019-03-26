library(Seurat)


### Name: FilterCells
### Title: Return a subset of the Seurat object
### Aliases: FilterCells

### ** Examples

head(x = FetchData(object = pbmc_small, vars.all = 'LTB'))
pbmc_filtered <- FilterCells(
  object = pbmc_small,
  subset.names = 'LTB',
  high.thresholds = 6
)
head(x = FetchData(object = pbmc_filtered, vars.all = 'LTB'))




