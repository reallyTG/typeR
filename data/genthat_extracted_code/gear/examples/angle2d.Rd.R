library(gear)


### Name: angle2d
### Title: Determine angle
### Aliases: angle2d

### ** Examples

coords1 = matrix(0, nrow = 8, ncol = 2)
coords2 = cbind(c(2, 2, 0, -2, -2, -2, 0, 2), c(0, 2, 2, 2, 0, -2, -2, -2))
angle2d(coords1, coords2)
angle2d(coords1, coords2, radians = TRUE)



