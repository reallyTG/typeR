library(lidR)


### Name: plot.lasmetrics3d
### Title: Plot voxelized LiDAR data
### Aliases: plot.lasmetrics3d

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
lidar = readLAS(LASfile)

voxels = grid_metrics3d(lidar, list(Imean = mean(Intensity)))
plot(voxels, color = "Imean", colorPalette = heat.colors(50), trim=0.99)



