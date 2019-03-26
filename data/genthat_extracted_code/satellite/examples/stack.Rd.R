library(satellite)


### Name: stack
### Title: Convert selected layers of a Satellite object to a RasterStack
### Aliases: stack stack,Satellite-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)

stck <- stack(sat, c("B001n", "B002n", "B003n"))
stck




