library(pRoloc)


### Name: setLisacol
### Title: Manage default colours and point characters
### Aliases: setLisacol getLisacol getOldcol setOldcol getStockcol
###   setStockcol getStockpch setStockpch getUnknowncol setUnknowncol
###   getUnknownpch setUnknownpch

### ** Examples

## defaults for clusters
getStockcol()
getStockpch()
## unknown features
getUnknownpch()
getUnknowncol()
## an example
library(pRolocdata)
data(dunkley2006)
par(mfrow = c(2, 1))
plot2D(dunkley2006, fcol = "markers", main = 'Default colours')
setUnknowncol("black")
plot2D(dunkley2006, fcol = "markers", main = 'setUnknowncol("black")')
getUnknowncol()
setUnknowncol(NULL)
getUnknowncol()
getStockcol()
getOldcol()



