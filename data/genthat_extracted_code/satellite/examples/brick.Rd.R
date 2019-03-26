library(satellite)


### Name: brick
### Title: Convert selected layers of a Satellite object to a RasterBrick
### Aliases: brick brick,Satellite-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)

brck <- brick(sat, c("B001n", "B002n", "B003n"))
brck




