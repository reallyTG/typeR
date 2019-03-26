library(compas)


### Name: calCo
### Title: Calculate Cartesian coordinates for 1-4 bonded atoms
### Aliases: calCo

### ** Examples

prevAtoms <- matrix(c(50.051, 37.144, -4.723,
 50.044, 36.248, -3.559,
 51.296, 35.369, -3.476), nrow=3, ncol=3, byrow=TRUE)
calCo(prevAtoms, length=1.33, bAngle=116.8, tAngle=-25.3)




