library(l1kdeconv)


### Name: rmoutlier1d
### Title: Remove the Outliers in a Vector of 1D Coordinates
### Aliases: rmoutlier1d
### Keywords: distribution

### ** Examples

x=c(1,10:30,50)
par(mfrow=c(2,1))
plot(density(x))
plot(density(rmoutlier1d(x)))



