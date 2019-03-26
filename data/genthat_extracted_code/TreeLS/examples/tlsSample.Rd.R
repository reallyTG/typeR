library(TreeLS)


### Name: tlsSample
### Title: Resample a point cloud
### Aliases: tlsSample

### ** Examples

file = system.file("extdata", "pine.laz", package="TreeLS")
tls = readTLS(file)
summary(tls)

## sample points systematically in 3D
vx = tlsSample(tls, voxelize(0.05))
summary(vx)

## sample points randomly
rd = tlsSample(tls, randomize(0.5))
summary(rd)




