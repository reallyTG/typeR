library(RsimMosaic)


### Name: createTiles
### Title: Tile creation from a folder of images
### Aliases: createTiles
### Keywords: utilities misc

### ** Examples

# Set the folder where the original images are located
pathToOriginalImages <- system.file("extdata/2Massier/", package="RsimMosaic")

# Set the folder where the tiles will be stored. It will be created if it does not exists.
pathToTileImages <- paste(tempdir(), "/myTiles/", sep="")

# Create the tiles (10 pix are used just to make this example run fast)
createTiles(pathToOriginalImages, pathToTileImages, tileHeight=10)




