library(lidR)


### Name: lasvoxelize
### Title: Voxelize a point cloud
### Aliases: lasvoxelize

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile, select = "xyz")

las2 = lasvoxelize(las, 2)
plot(las2)



