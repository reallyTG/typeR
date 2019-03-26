library(TreeLS)


### Name: tlsAlter
### Title: Alter point cloud's coordinates
### Aliases: tlsAlter

### ** Examples

file = system.file("extdata", "pine.laz", package="TreeLS")
tls = readTLS(file)

### swap the Y and Z axes
zy = tlsAlter(tls, c('x', 'z', 'y'))
bbox(zy)
range(zy$Z)
plot(zy, clear_artifacts=FALSE)
rgl::axes3d(col='white')

### return an upside down point cloud
ud = tlsAlter(tls, c('x', 'y', '-z'))
bbox(ud)
range(ud$Z)
plot(zy, clear_artifacts=FALSE)
rgl::axes3d(col='white')

### mirror all axes, then set the point cloud's starting point as the origin
rv = tlsAlter(tls, c('-x', '-y', '-z'), bring_to_origin=TRUE)
bbox(rv)
range(rv$Z)
plot(rv, clear_artifacts=FALSE)
rgl::axes3d(col='white')




