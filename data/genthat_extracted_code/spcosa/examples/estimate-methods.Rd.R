library(spcosa)


### Name: estimate-methods
### Title: Estimating Statistics
### Aliases: estimate-methods estimate
###   estimate,character,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method
###   estimate,character,CompactStratificationEqualArea,SamplingPatternRandomComposite,data.frame-method
###   estimate,SamplingVariance,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method
###   estimate,SamplingVariance,CompactStratificationEqualArea,SamplingPatternRandomComposite,data.frame-method
###   estimate,SpatialCumulativeDistributionFunction,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method
###   estimate,SpatialMean,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method
###   estimate,SpatialMean,CompactStratificationEqualArea,SamplingPatternRandomComposite,data.frame-method
###   estimate,SpatialVariance,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method
###   estimate,StandardError,CompactStratification,SamplingPatternRandomSamplingUnits,data.frame-method
### Keywords: methods

### ** Examples


# Note: the example below requires the 'rgdal'-package.
# You may consider the 'maptools'-package as an alternative
if (require(rgdal)) {
    # read vector representation of the "Mijdrecht" area
    shp <- readOGR(
        dsn = system.file("maps", package = "spcosa"),
        layer = "mijdrecht"
    )

    # stratify  into 30 strata
    myStratification <- stratify(shp, nStrata = 30, nTry = 10, verbose = TRUE)

    # random sampling of two sampling units per stratum
    mySamplingPattern <- spsample(myStratification, n = 2)

    # plot sampling pattern
    plot(myStratification, mySamplingPattern)

    # simulate data
    # (in real world cases these data have to be obtained by field work etc.)
    myData <- as(mySamplingPattern, "data.frame")
    myData$observation <- rnorm(n = nrow(myData), mean = 10, sd = 1)

    # design-based inference
    estimate("spatial mean", myStratification, mySamplingPattern, myData["observation"])
    estimate("sampling variance", myStratification, mySamplingPattern, myData["observation"])
    estimate("standard error", myStratification, mySamplingPattern, myData["observation"])
    estimate("spatial variance", myStratification, mySamplingPattern, myData["observation"])
    estimate("scdf", myStratification, mySamplingPattern, myData["observation"])
}



