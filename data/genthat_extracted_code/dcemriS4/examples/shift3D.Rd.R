library(dcemriS4)


### Name: shift3D
### Title: Shift a 3D Array in One Dimension
### Aliases: shift3D

### ** Examples

cube <- array(0, rep(20,3))
cube[9:12,9:12,9:12] <- 1
cube.shift <- shift3D(cube, 5, type="AP")
par(mfrow=c(1,2), mar=rep(0.5,4))
image(cube[,,10], xlab="", ylab="", axes=FALSE)
image(cube.shift[,,10], xlab="", ylab="", axes=FALSE)



