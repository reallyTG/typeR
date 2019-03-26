library(lidR)


### Name: highest
### Title: Point Cloud Decimation Algorithm
### Aliases: highest

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile, select = "xyz")

# Select the highest point within each cell of an overlayed grid
thinned = lasfilterdecimate(las, highest(4))
plot(thinned)



