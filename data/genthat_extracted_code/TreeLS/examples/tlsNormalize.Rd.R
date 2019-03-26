library(TreeLS)


### Name: tlsNormalize
### Title: Normalize a TLS point cloud
### Aliases: tlsNormalize

### ** Examples

file = system.file("extdata", "pine_plot.laz", package="TreeLS")
tls = readTLS(file)
plot(tls)
rgl::axes3d(col='white')

### remove topography effect
tls = tlsNormalize(tls, 0.5, FALSE)
plot(tls)
rgl::axes3d(col='white')




