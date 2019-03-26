library(Seurat)


### Name: SubsetRow
### Title: Return a subset of rows for a matrix or data frame
### Aliases: SubsetRow

### ** Examples

cd_genes <- SubsetRow(data = pbmc_small@raw.data, code = 'CD')
head(as.matrix(cd_genes)[, 1:4])




