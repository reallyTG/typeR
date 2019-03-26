library(fisheyeR)


### Name: POICalc
### Title: Function to generate coordinates points to plot using POIs
### Aliases: POICalc

### ** Examples

## Not run: 
##D    ## IRIS Example
##D    data(iris)
##D    
##D    # distance of each element to each dimension max and min
##D    matrizSim = cbind(
##D                1 - (max(iris[,1]) - iris[,1]) / (max(max(iris[,1]) - iris[,1])),
##D                1 - (max(iris[,2]) - iris[,2]) / (max(max(iris[,2]) - iris[,2])),
##D                1 - (max(iris[,3]) - iris[,3]) / (max(max(iris[,3]) - iris[,3])),
##D                1 - (max(iris[,4]) - iris[,4]) / (max(max(iris[,4]) - iris[,4])),
##D 
##D                1 - (min(iris[,1]) - iris[,1]) / (min(min(iris[,1]) - iris[,1])),
##D                1 - (min(iris[,2]) - iris[,2]) / (min(min(iris[,2]) - iris[,2])),
##D                1 - (min(iris[,3]) - iris[,3]) / (min(min(iris[,3]) - iris[,3])),
##D                1 - (min(iris[,4]) - iris[,4]) / (min(min(iris[,4]) - iris[,4])))
##D 
##D    # exaggerate diffs
##D    matrizSim  = matrizSim^3 
##D    
##D    # Create POI plot
##D    irisPOI = POICreate('POI')
##D    irisPOI@matrizSim <- matrizSim
##D    irisPOI@wordsInQuery <- c('high.Sepal.Length', 'high.Sepal.Width', 'high.Petal.Length', 'high.Petal.Width',
##D                              'low.Sepal.Length', 'low.Sepal.Width', 'low.Petal.Length', 'low.Petal.Width')
##D    POIcoords(irisPOI) <- POICalc(irisPOI ,length(irisPOI@wordsInQuery))
##D    irisPOI@docs <- cbind(matrix(seq(1:nrow(irisPOI@objeto))),matrix(seq(1:nrow(irisPOI@objeto))))
##D    irisPOI@colores <- c(rep(2,50),rep(3,50),rep(4,50))
##D    try(rm('POI.env'), silent = T)
##D    plotPOI(irisPOI)
## End(Not run)



