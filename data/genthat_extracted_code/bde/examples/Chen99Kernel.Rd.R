library(bde)


### Name: Chen99Kernel
### Title: Class '"Chen99Kernel"'
### Aliases: Chen99Kernel Chen99Kernel-class
### Keywords: classes

### ** Examples

# create the model 
kernel.noModified <- chen99Kernel(dataPoints = tuna.r, b = 0.01, modified = FALSE)
kernel.Modified <- chen99Kernel(dataPoints = tuna.r, b = 0.01, modified = TRUE)

# examples of usual functions
density(kernel.noModified,0.5)
density(kernel.Modified,0.5)

distribution(kernel.noModified,1,discreteApproximation=FALSE)
distribution(kernel.noModified,1,discreteApproximation=TRUE)
 
distribution(kernel.Modified,1,discreteApproximation=FALSE)
distribution(kernel.Modified,1,discreteApproximation=TRUE)
 
# graphical representation
hist(tuna.r,freq=FALSE,main="Chen99 Kernels Tuna Data")
lines(kernel.noModified,col="red",lwd=2)
lines(kernel.Modified,col="blue",lwd=2)

# graphical representation using ggplot2 
graph <- gplot(list("KernelNoModified"=kernel.noModified,
                "KernelModified"=kernel.Modified),show=TRUE)



