library(VIM)


### Name: mosaicMiss
### Title: Mosaic plot with information about missing/imputed values
### Aliases: mosaicMiss
### Keywords: hplot

### ** Examples


data(sleep, package = "VIM")
## for missing values
mosaicMiss(sleep, highlight = 4, 
    plotvars = 8:10, miss.labels = FALSE)

## for imputed values
mosaicMiss(kNN(sleep), highlight = 4, 
    plotvars = 8:10, delimiter = "_imp", miss.labels = FALSE)




