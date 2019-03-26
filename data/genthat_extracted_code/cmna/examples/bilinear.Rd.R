library(cmna)


### Name: bilinear
### Title: Bilinear interpolation
### Aliases: bilinear

### ** Examples

x <- c(2, 4)
y <- c(4, 7)
z <- matrix(c(81, 84, 85, 89), nrow = 2)
newx <- c(2.5, 3, 3.5)
newy <- c(5, 5.5, 6)
bilinear(x, y, z, newx, newy)




