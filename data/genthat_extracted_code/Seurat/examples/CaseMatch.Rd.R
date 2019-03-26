library(Seurat)


### Name: CaseMatch
### Title: Match the case of character vectors
### Aliases: CaseMatch

### ** Examples

cd_genes <- c('Cd79b', 'Cd19', 'Cd200')
CaseMatch(search = cd_genes, match = rownames(x = pbmc_small@raw.data))




