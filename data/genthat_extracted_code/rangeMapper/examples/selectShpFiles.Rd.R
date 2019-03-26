library(rangeMapper)


### Name: selectShpFiles
### Title: Select (recursively) shape files
### Aliases: selectShpFiles

### ** Examples

f = system.file(package="rangeMapper", "extdata", "wrens", "vector")
res = selectShpFiles(f, ogr = TRUE, polygons.only = TRUE)
head(res)




