library(lidR)


### Name: lassmooth
### Title: Smooth a point cloud
### Aliases: lassmooth lasunsmooth

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las <- readLAS(LASfile, select = "xyz")

las <- lasfiltersurfacepoints(las, 1)
plot(las)

las <- lassmooth(las, 5, "gaussian", "circle", sigma = 2)
plot(las)

las <- lasunsmooth(las)
plot(las)



