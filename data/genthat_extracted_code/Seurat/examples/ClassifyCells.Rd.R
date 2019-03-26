library(Seurat)


### Name: ClassifyCells
### Title: Classify New Data
### Aliases: ClassifyCells

### ** Examples

pbmc_small
# take the first 10 cells as test data and train on the remaining 70 cells
test.pbmc <- SubsetData(object = pbmc_small, cells.use = pbmc_small@cell.names[1:10])
train.pbmc <- SubsetData(object = pbmc_small, cells.use = pbmc_small@cell.names[11:80])
predicted.classes <- ClassifyCells(
  object = train.pbmc,
  training.classes = train.pbmc@ident,
  new.data = test.pbmc@data
)




