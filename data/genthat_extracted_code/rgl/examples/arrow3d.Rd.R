library(rgl)


### Name: arrow3d
### Title: Draw an arrow in a scene.
### Aliases: arrow3d

### ** Examples

## No test: 
xyz <- matrix(rnorm(300), ncol = 3)
plot3d(xyz)
arrow3d(xyz[1,], xyz[2,], type = "extrusion", col = "red")
arrow3d(xyz[3,], xyz[4,], type = "flat",      col = "blue")
arrow3d(xyz[5,], xyz[6,], type = "rotation",  col = "green")
arrow3d(xyz[7,], xyz[8,], type = "lines",     col = "black")
arrow3d(spriteOrigin = xyz[9:12,],            col = "purple")
## End(No test)



