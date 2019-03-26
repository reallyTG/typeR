library(lidR)


### Name: is.empty
### Title: Test if a 'LAS' object is empty
### Aliases: is.empty is.empty,LAS-method

### ** Examples

LASfile <- system.file("extdata", "example.laz", package="rlas")
las = readLAS(LASfile)
is.empty(las)

las = new("LAS")
is.empty(las)



