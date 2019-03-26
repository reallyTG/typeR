library(bde)


### Name: JonesCorrectionMuller91BoundaryKernel
### Title: Class '"JonesCorrectionMuller91BoundaryKernel"'
### Aliases: JonesCorrectionMuller91BoundaryKernel
###   JonesCorrectionMuller91BoundaryKernel-class
### Keywords: classes

### ** Examples

# create the model 
kernel <-jonesCorrectionMuller91BoundaryKernel(dataPoints = tuna.r, b = 0.01, mu = 2)


# examples of usual functions
density(kernel,0.5)

distribution(kernel,0.5,discreteApproximation=FALSE)
 
# graphical representation
hist(tuna.r,freq=FALSE,main="Tuna Data")
lines(kernel, col="red",lwd=2)

# graphical representation using ggplot2 
graph <- gplot(kernel, show=TRUE, includePoints=TRUE)




