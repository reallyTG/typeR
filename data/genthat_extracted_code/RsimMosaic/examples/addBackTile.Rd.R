library(RsimMosaic)


### Name: addBackTile
### Title: Add a tile back to the tile library
### Aliases: addBackTile
### Keywords: utilities misc

### ** Examples

# Creates the tile library data frame from the example tiles
my2MassTilesFull <- createLibraryIndexDataFrame(system.file("extdata/2Massier/",
 package="RsimMosaic"))
my2MassTiles <- my2MassTilesFull

# Get a random filename of one of the tiles
idx <- round(runif(1, 1, length(my2MassTiles[,1])))
tileFilename <- as.character(my2MassTiles[idx,1])

# Remove it from the library
my2MassTiles <- removeTile(tileFilename, my2MassTiles)

# Now, put it back
my2MassTiles <- addBackTile(tileFilename, my2MassTiles, my2MassTilesFull)



