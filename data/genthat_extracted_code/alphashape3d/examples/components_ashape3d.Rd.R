library(alphashape3d)


### Name: components_ashape3d
### Title: Connected subsets computation
### Aliases: components_ashape3d

### ** Examples


T1 <- rtorus(1000, 0.5, 2)
T2 <- rtorus(1000, 0.5, 2, ct = c(2, 0, 0), rotx = pi/2)
x <- rbind(T1, T2)
alpha <- c(0.25, 2)
ashape3d.obj <- ashape3d(x, alpha = alpha)
plot(ashape3d.obj, indexAlpha = "all")

# Connected components of the alpha-shape for both values of alpha
comp <- components_ashape3d(ashape3d.obj, indexAlpha = "all")
class(comp)
# Number of components and points in each component for alpha=0.25
table(comp[[1]])
# Number of components and points in each component for alpha=2
table(comp[[2]])

# Plot the connected components for alpha=0.25
plot(ashape3d.obj, byComponents = TRUE, indexAlpha = 1)




