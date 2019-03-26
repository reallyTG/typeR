library(rworldmap)


### Name: mapGriddedData
### Title: Produce maps of global gridded data at half degree resolution
### Aliases: mapGriddedData
### Keywords: hplot

### ** Examples


## mapping continuous data
data(gridExData,envir=environment(),package="rworldmap")
gridExData <- get("gridExData")
mapGriddedData(gridExData)

## reclassing continuous data to categorical & mapping
data(gridExData,envir=environment(),package="rworldmap")
#find quartile breaks
cutVector <- quantile(gridExData@data[,1],na.rm=TRUE)
#classify the data to a factor
gridExData@data$categories <- cut( gridExData@data[,1]
                                      , cutVector, include.lowest=TRUE)
#rename the categories
levels(gridExData@data$categories) <- c('low', 'med', 'high', 'vhigh')
#mapping
mapGriddedData( gridExData, nameColumnToPlot= 'categories'
              , catMethod='categorical')






