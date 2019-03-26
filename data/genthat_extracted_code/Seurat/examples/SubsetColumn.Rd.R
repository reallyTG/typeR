library(Seurat)


### Name: SubsetColumn
### Title: Return a subset of columns for a matrix or data frame
### Aliases: SubsetColumn

### ** Examples

head(as.matrix(SubsetColumn(data = pbmc_small@raw.data, code = 'ATGC'))[, 1:4])




