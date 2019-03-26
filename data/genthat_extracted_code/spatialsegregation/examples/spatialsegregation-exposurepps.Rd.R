library(spatialsegregation)


### Name: exposurepps
### Title: Example datasets for package spatialsegregation
### Aliases: exposurepps
### Keywords: spatial

### ** Examples

 data(exposurepps)
 par(mfrow=c(3,3), mar=c(2,2,2,2))
 for(i in 1:9)plot(exposurepps[[i]])

# upper row has strong inter-type mingling effect
# lower row has strong inter-type repulsion or segregation
# left column has strong intra-type clustering
# right column has strong intra-type repulsion.

 par(mfrow=c(3,3), mar=c(3,3,4,3))
 for(i in 1:9)plot(  isarF(exposurepps[[i]]), cbind(ISARmean,theo)~par)




