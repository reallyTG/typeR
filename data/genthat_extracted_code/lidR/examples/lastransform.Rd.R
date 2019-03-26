library(lidR)


### Name: lastransform
### Title: Datum transformation for LAS objects
### Aliases: lastransform

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las <- readLAS(LASfile, select = "xyzrn")

head(las@data)

las <- lastransform(las, 26918)



