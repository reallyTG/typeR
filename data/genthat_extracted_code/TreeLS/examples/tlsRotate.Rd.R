library(TreeLS)


### Name: tlsRotate
### Title: Rotate point cloud towards a horizontal plane
### Aliases: tlsRotate

### ** Examples

file = system.file("extdata", "pine_plot.laz", package="TreeLS")
tls = readTLS(file)

### note the tilted ground
plot(tls)
rgl::axes3d(col='white')

### after rotation
tls = tlsRotate(tls)
plot(tls)
rgl::axes3d(col='white')




