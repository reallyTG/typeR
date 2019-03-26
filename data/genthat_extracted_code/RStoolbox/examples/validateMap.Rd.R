library(RStoolbox)


### Name: validateMap
### Title: Map accuracy assessment
### Aliases: validateMap

### ** Examples

## Not run: 
##D library(caret)
##D library(raster)
##D 
##D ## Training data
##D data(lsat)
##D poly     <- readRDS(system.file("external/trainingPolygons.rds", package="RStoolbox"))
##D 
##D ## Split training data in training and validation set (50%-50%)
##D splitIn   <- createDataPartition(poly$class, p = .5)[[1]]
##D train <- poly[splitIn,]
##D val   <- poly[-splitIn,]
##D 
##D ## Classify (deliberately poorly)
##D sc <- superClass(lsat, trainData = train, responseCol = "class", nSamples = 50, model = "mlc")
##D 
##D ## Polish map with majority filter
##D 
##D polishedMap <- focal(sc$map, matrix(1,3,3), fun = modal) 
##D 
##D ## Validation
##D ## Before filtering
##D val0 <- validateMap(sc$map, valData = val, responseCol = "class", 
##D                             classMapping = sc$classMapping)
##D ## After filtering
##D val1 <- validateMap(polishedMap, valData = val, responseCol = "class",
##D                              classMapping = sc$classMapping)
## End(Not run)



