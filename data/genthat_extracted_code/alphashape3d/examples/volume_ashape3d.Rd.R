library(alphashape3d)


### Name: volume_ashape3d
### Title: Volume computation
### Aliases: volume_ashape3d

### ** Examples


C1 <- matrix(runif(6000), nc = 3)
C2 <- matrix(runif(6000), nc = 3) + 2
x <- rbind(C1, C2)
ashape3d.obj <- ashape3d(x, alpha = 0.75)
plot(ashape3d.obj, byComponents = TRUE)

# Compute the volume of the alpha-shape
volume_ashape3d(ashape3d.obj)
# Compute the volumes of the connected components of the alpha-shape
volume_ashape3d(ashape3d.obj, byComponents = TRUE)




