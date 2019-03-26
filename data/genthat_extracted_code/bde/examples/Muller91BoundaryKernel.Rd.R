library(bde)


### Name: Muller91BoundaryKernel
### Title: Class '"Muller91BoundaryKernel"'
### Aliases: Muller91BoundaryKernel Muller91BoundaryKernel-class
### Keywords: classes

### ** Examples

# create the model 
kernel <- muller91BoundaryKernel(dataPoints = tuna.r, b = 0.01, mu = 2)


# examples of usual functions
density(kernel,0.5)

distribution(kernel,0.5,discreteApproximation=FALSE)
 
# graphical representation
hist(tuna.r,freq=FALSE,main="Tuna Data")
lines(kernel, col="red",lwd=2)

# graphical representation using ggplot2 
graph <- gplot(kernel, show=TRUE, includePoints=TRUE)



