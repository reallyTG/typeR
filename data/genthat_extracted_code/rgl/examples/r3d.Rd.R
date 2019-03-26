library(rgl)


### Name: r3d
### Title: Generic 3D interface
### Aliases: r3d
### Keywords: dynamic

### ** Examples

    
     x <- c(0, 1, 0, 0)
     y <- c(0, 0, 1, 0)
     z <- c(0, 0, 0, 1)
     labels <- c("Origin", "X", "Y", "Z")
     i <- c(1, 2, 1, 3, 1, 4)

     # rgl.* interface
     
     rgl.open()
     rgl.texts(x, y, z, labels)
     rgl.texts(1, 1, 1, "rgl.* coordinates")
     rgl.lines(x[i], y[i], z[i])

     # *3d interface
     
     open3d()
     text3d(x, y, z, labels)
     text3d(1, 1, 1, "*3d coordinates")
     segments3d(x[i], y[i], z[i])



