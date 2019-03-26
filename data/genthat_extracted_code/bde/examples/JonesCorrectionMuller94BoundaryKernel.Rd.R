library(bde)


### Name: JonesCorrectionMuller94BoundaryKernel
### Title: Class '"JonesCorrectionMuller94BoundaryKernel"'
### Aliases: JonesCorrectionMuller94BoundaryKernel
###   JonesCorrectionMuller94BoundaryKernel-class
### Keywords: classes

### ** Examples

# data points to cache densities and distribution
cache <- seq(0,1,0.01)

# create the model 
kernel <-jonesCorrectionMuller94BoundaryKernel(dataPoints = tuna.r, b = 0.01, mu = 2, 
                                                dataPointsCache = cache)


# examples of usual functions
density(kernel,0.5)

distribution(kernel,0.5,discreteApproximation=FALSE)
 
# graphical representation
hist(tuna.r,freq=FALSE,main="Tuna Data")
lines(kernel, col="red",lwd=2)

# graphical representation using ggplot2 
graph <- gplot(kernel, show=TRUE, includePoints = TRUE)



