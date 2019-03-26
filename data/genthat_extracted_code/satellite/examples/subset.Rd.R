library(satellite)


### Name: subset
### Title: Subset of Satellite object data layers
### Aliases: subset subset,Satellite-method subset,Satellite-method
###   [[,Satellite,ANY,ANY-method

### ** Examples

## sample data
path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)

sat[[2:5]]
subset(sat, cid = "SC")



