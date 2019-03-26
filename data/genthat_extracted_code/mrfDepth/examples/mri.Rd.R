library(mrfDepth)


### Name: mri
### Title: Intensities of MRI images
### Aliases: mri
### Keywords: datasets

### ** Examples

data(mri)
par(mfrow = c(2,1))
matplot(y = mri$bodypart1[,,1],
        type ="l",col = "black", lty = 1, xlab = "", ylab="x-coordinate", main = "plane 1")
matplot(y = mri$bodypart2[,,1],
        type ="l",col = "black", lty = 1, xlab = "", ylab="x-coordinate", main = "plane 2")
par(mfrow = c(1,1))



