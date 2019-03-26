library(alphashape3d)


### Name: surfaceNormals
### Title: Normal vectors computation
### Aliases: surfaceNormals

### ** Examples


x <- rtorus(1000, 0.5, 1)
alpha <- 0.25
ashape3d.obj <- ashape3d(x, alpha = alpha)
surfaceNormals(ashape3d.obj, display = TRUE)




