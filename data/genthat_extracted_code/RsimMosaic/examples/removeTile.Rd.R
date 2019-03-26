library(RsimMosaic)


### Name: removeTile
### Title: Remove a tile from the tile library
### Aliases: removeTile
### Keywords: utilities misc

### ** Examples

# Creates the tile library data frame from the example tiles
my2MassTiles <- createLibraryIndexDataFrame(system.file("extdata/2Massier", package="RsimMosaic"))

# Get a random filename of one of the tiles
idx <- round(runif(1, 1, length(my2MassTiles[,1])))
tileToRemove <- as.character(my2MassTiles[idx,1])

# Remove it from the library
my2MassTiles <- removeTile(tileToRemove, my2MassTiles)



