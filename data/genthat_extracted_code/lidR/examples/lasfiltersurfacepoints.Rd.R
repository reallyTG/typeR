library(lidR)


### Name: lasfiltersurfacepoints
### Title: Filter the surface points
### Aliases: lasfiltersurfacepoints

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile)
subset = lasfiltersurfacepoints(las, 2)
plot(subset)




