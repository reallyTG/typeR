library(Seurat)


### Name: MakeSparse
### Title: Make object sparse
### Aliases: MakeSparse

### ** Examples

pbmc_raw <- read.table(
  file = system.file('extdata', 'pbmc_raw.txt', package = 'Seurat'),
  as.is = TRUE
)
pbmc_small <- CreateSeuratObject(raw.data = pbmc_raw)
class(x = pbmc_small@raw.data)
pbmc_small <- MakeSparse(object = pbmc_small)
class(x = pbmc_small@raw.data)




