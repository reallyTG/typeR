library(smoothAPC)


### Name: plot3d.matrix
### Title: Presents matrix as a 3D surface
### Aliases: plot3d.matrix

### ** Examples

## No test: 

plot3d(matrix(rnorm(100),10,10))
plot3d(matrix(1:100,10,10), c("Dimension 1", "Dimension 2", "Value"))

library(demography)
m <- log(fr.mort$rate$female[1:30, 150:160])
plot3d(m)
plot3d(m, color.palette = "special")
plot3d(m, color.palette = rainbow)
## End(No test)



