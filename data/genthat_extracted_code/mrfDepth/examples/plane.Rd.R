library(mrfDepth)


### Name: plane
### Title: Fighter plane dataset
### Aliases: plane
### Keywords: datasets

### ** Examples

data(plane)
par(mfrow = c(2,1))
matplot(y = plane$plane1[,,1],
        type ="l",col = "black", lty = 1, xlab = "", ylab="x-coordinate", main = "plane 1")
matplot(y = plane$plane2[,,1],
        type ="l",col = "black", lty = 1, xlab = "", ylab="x-coordinate", main = "plane 2")
par(mfrow = c(1,1))



