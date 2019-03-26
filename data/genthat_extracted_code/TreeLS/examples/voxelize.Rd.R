library(TreeLS)


### Name: voxelize
### Title: Point sampling algorithm: systematic voxel grid
### Aliases: voxelize

### ** Examples

file = system.file("extdata", "pine.laz", package="TreeLS")
tls = readTLS(file)
print(tls)

### thin point cloud - note the point count
tls = tlsSample(tls, voxelize(0.05))
print(tls)




