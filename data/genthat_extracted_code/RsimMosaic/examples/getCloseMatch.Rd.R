library(RsimMosaic)


### Name: getCloseMatch
### Title: Get a tile which is a close match for a pixel in the parameter
###   space
### Aliases: getCloseMatch
### Keywords: utilities misc

### ** Examples

# Creates the tile library data frame from the example tiles
my2MassTiles <- createLibraryIndexDataFrame(system.file("extdata/2Massier", package="RsimMosaic"))

# Get a close match for the point with parameters (0.2, 0.3, 0.2)
getCloseMatch(c(0.2, 0.3, 0.2), my2MassTiles)

# Get another close match for the point with parameters (0.2, 0.3, 0.2)
getCloseMatch(c(0.2, 0.3, 0.2), my2MassTiles)



