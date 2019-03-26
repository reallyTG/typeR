library(bde)


### Name: MacroBetaChen99Kernel
### Title: Class '"MacroBetaChen99Kernel"'
### Aliases: MacroBetaChen99Kernel MacroBetaChen99Kernel-class
### Keywords: classes

### ** Examples

# create the model 
kernel.noModified <- macroBetaChen99Kernel(dataPoints = tuna.r, b = 0.01,
                        modified = FALSE)
kernel.Modified <- macroBetaChen99Kernel(dataPoints = tuna.r, b = 0.01,
                        modified = TRUE)

# examples of usual functions
density(kernel.noModified,0.5)
density(kernel.Modified,0.5)

distribution(kernel.noModified,1,discreteApproximation=FALSE)
distribution(kernel.noModified,1,discreteApproximation=TRUE)
 
distribution(kernel.Modified,1,discreteApproximation=FALSE)
distribution(kernel.Modified,1,discreteApproximation=TRUE)
 
# graphical representation
hist(tuna.r,freq=FALSE,main="Chen99 Kernels Tuna Data")
lines(kernel.noModified, col="red",lwd=2)
lines(kernel.Modified,col="blue",lwd=2)

# graphical representation using ggplot2 
graph <- gplot(list("noModified"=kernel.noModified, 
          "modified"=kernel.Modified), show=TRUE)



