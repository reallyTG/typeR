library(alphashape3d)


### Name: ashape3d
### Title: 3D alpha-shape computation
### Aliases: ashape3d

### ** Examples


T1 <- rtorus(1000, 0.5, 2)
T2 <- rtorus(1000, 0.5, 2, ct = c(2, 0, 0), rotx = pi/2)
x <- rbind(T1, T2)
# Value of alpha
alpha <- 0.25
# 3D alpha-shape
ashape3d.obj <- ashape3d(x, alpha = alpha)
plot(ashape3d.obj)

# For new values of alpha, we can use ashape3d.obj as input (faster)
alpha <- c(0.15, 1)
ashape3d.obj <- ashape3d(ashape3d.obj, alpha = alpha)
plot(ashape3d.obj, indexAlpha = 2:3)




