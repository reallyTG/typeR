library(mclust)


### Name: cdensE
### Title: Component Density for a Parameterized MVN Mixture Model
### Aliases: cdensE cdensV cdensX cdensEII cdensVII cdensEEI cdensVEI
###   cdensEVI cdensVVI cdensEEE cdensEEV cdensVEV cdensVVV cdensEVE
###   cdensEVV cdensVEE cdensVVE cdensXII cdensXXI cdensXXX
### Keywords: cluster

### ** Examples

## Not run: 
##D z2 <- unmap(hclass(hcVVV(faithful),2)) # initial value for 2 class case
##D 
##D model <- meVVV(data=faithful, z=z2)
##D cdensVVV(data=faithful, logarithm = TRUE, parameters = model$parameters)
##D 
##D data(cross)
##D z2 <- unmap(cross[,1])
##D 
##D model <- meEEV(data = cross[,-1], z = z2)
##D 
##D EEVdensities <- cdensEEV( data = cross[,-1], parameters = model$parameters)
##D 
##D cbind(cross[,-1],map(EEVdensities))
## End(Not run)



