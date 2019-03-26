library(Seurat)


### Name: CreateSeuratObject
### Title: Initialize and setup the Seurat object
### Aliases: CreateSeuratObject

### ** Examples

pbmc_raw <- read.table(
  file = system.file('extdata', 'pbmc_raw.txt', package = 'Seurat'),
  as.is = TRUE
)
pbmc_small <- CreateSeuratObject(raw.data = pbmc_raw)
pbmc_small




