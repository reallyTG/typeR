library(spcosa)


### Name: spsample-methods
### Title: Spatial Sampling of Compact Strata
### Aliases: spsample spsample,CompactStratification,missing,missing-method
###   spsample,CompactStratification,numeric,missing-method
###   spsample,CompactStratificationEqualArea,numeric,character-method
###   spsample,CompactStratificationPriorPoints,missing,missing-method
### Keywords: methods

### ** Examples

# Note: the example below requires the 'rgdal'-package.
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

    # sample two sampling units per stratum
    mySamplingPattern <- spsample(myStratification, n = 2)

    # plot the resulting sampling pattern on
    # top of the stratification
    plot(myStratification, mySamplingPattern)

}



