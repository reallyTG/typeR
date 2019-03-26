library(SpatialVx)


### Name: bearing
### Title: Bearing from One Spatial Location to Another
### Aliases: bearing
### Keywords: math

### ** Examples


# Boulder, Colorado and Wallaroo, Australia.
A <- rbind(c(-105.2833, 40.0167), c(137.65, -33.9333))

# Wallaroo, Australia and Boulder, Colorado.
B <- rbind(c(137.65, -33.9333), c(-105.2833, 40.0167))

bearing(A,B)
bearing(A,B,aty="radial")

plot(A, type="n", xlab="", ylab="")
points(A[,1], A[,2], pch="*", col="darkblue")

# Boulder, Colorado to Wallaroo, Australia.
arrows(A[1,1], A[1,2], A[2,1], A[2,2], col="red", lwd=1.5)



