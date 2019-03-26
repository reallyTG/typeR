library(dimRed)


### Name: mixColorRamps
### Title: Mixing color ramps
### Aliases: mixColorRamps mixColor1Ramps mixColor2Ramps mixColor3Ramps

### ** Examples

cols <- expand.grid(x = seq(0, 1, length.out = 10),
                    y = seq(0, 1, length.out = 10),
                    z = seq(0, 1, length.out = 10))
mixed <- mixColor3Ramps(cols)

## Not run: 
##D library(rgl)
##D plot3d(cols$x, cols$y, cols$z, col = mixed, pch = 15)
##D 
##D cols <- expand.grid(x = seq(0, 1, length.out = 10),
##D                     y = seq(0, 1, length.out = 10))
##D mixed <- mixColor2Ramps(cols)
## End(Not run)

plot(cols$x, cols$y, col = mixed, pch = 15)



