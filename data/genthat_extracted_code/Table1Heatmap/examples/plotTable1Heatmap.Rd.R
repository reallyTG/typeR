library(Table1Heatmap)


### Name: plotTable1Heatmap
### Title: plotTable1Heatmap
### Aliases: plotTable1Heatmap

### ** Examples

lst <- list(a=sample(c(TRUE,FALSE), 10, replace=TRUE), b=sample(c(TRUE,FALSE), 10, replace=TRUE),
c=sample(c(TRUE,FALSE), 10, replace=TRUE))
lst <- lapply(lst, as.factor)

dev.new(height=10, width=10)

plotTable1Heatmap(factorList=lst, method='AssociationByP', drawRaster=TRUE)

plotTable1Heatmap(factorList=lst, method='CrosstableByP', drawRaster=TRUE)

plotTable1Heatmap(factorList=lst, method='CrosstableByN', drawRaster=TRUE)



