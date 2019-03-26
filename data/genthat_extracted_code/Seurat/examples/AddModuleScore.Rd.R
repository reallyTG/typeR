library(Seurat)


### Name: AddModuleScore
### Title: Calculate module scores for gene expression programs in single
###   cells
### Aliases: AddModuleScore

### ** Examples

cd_genes <- list(c(
  'CD79B',
  'CD79A',
  'CD19',
  'CD180',
  'CD200',
  'CD3D',
  'CD2',
  'CD3E',
  'CD7',
  'CD8A',
  'CD14',
  'CD1C',
  'CD68',
  'CD9',
  'CD247'
))
pbmc_small <- AddModuleScore(
  object = pbmc_small,
  genes.list = cd_genes,
  ctrl.size = 5,
  enrich.name = 'CD_Genes'
)
head(x = pbmc_small@meta.data)




