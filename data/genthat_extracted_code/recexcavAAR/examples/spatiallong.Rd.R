library(recexcavAAR)


### Name: spatiallong
### Title: Transformation of numeric matrices from wide to long format
### Aliases: spatiallong

### ** Examples

x <- c(1, 1, 1, 2, 2, 2, 3, 3, 4)
y <- c(1, 2, 3, 1, 2, 3, 1, 2, 3)
z <- c(3, 4, 2, 3, NA, 5, 6, 3, 1)

sw <- spatialwide(x, y, z, digits = 3)

spatiallong(sw$x, sw$y, sw$z)




