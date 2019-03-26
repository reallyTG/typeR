library(spcosa)


### Name: stratify-methods
### Title: Stratification
### Aliases: stratify-methods stratify stratify,SpatialPixels-method
###   stratify,SpatialGrid-method stratify,SpatialPolygons-method
### Keywords: methods

### ** Examples

# Note: the example below requires the 'rgdal'-package
# You may consider the 'maptools'-package as an alternative
if (require(rgdal)) {

    # read a vector representation of the `Farmsum' field
    shpFarmsum <- readOGR(
        dsn = system.file("maps", package = "spcosa"),
        layer = "farmsum"
    )

    # stratify `Farmsum' into 50 strata
    # NB: increase argument 'nTry' to get better results
    set.seed(314)
    myStratification <- stratify(shpFarmsum, nStrata = 50, nTry = 1)

    # plot the resulting stratification
    plot(myStratification)

}



