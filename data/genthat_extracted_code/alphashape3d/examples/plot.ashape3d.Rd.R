library(alphashape3d)


### Name: plot.ashape3d
### Title: Plot the alpha-shape in 3D
### Aliases: plot.ashape3d

### ** Examples


T1 <- rtorus(1000, 0.5, 2)
T2 <- rtorus(1000, 0.5, 2, ct = c(2, 0, 0), rotx = pi/2)
x <- rbind(T1, T2)
alpha <- c(0.15, 0.25, 1)
ashape3d.obj <- ashape3d(x, alpha = alpha)

# Plot the alpha-shape for all values of alpha
plot(ashape3d.obj, indexAlpha = "all")

# Plot the connected components of the alpha-shape for alpha=0.25
plot(ashape3d.obj, byComponents = TRUE, indexAlpha = 2)




