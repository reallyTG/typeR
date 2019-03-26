library(hypervolume)


### Name: plot.HypervolumeList
### Title: Plot a hypervolume or list of hypervolumes
### Aliases: plot.Hypervolume plot.HypervolumeList

### ** Examples

## Not run: 
##D data(iris)
##D hv = hypervolume_gaussian(iris[,1:3])
##D 
##D plot(hv, show.3d=TRUE)
##D plot(hv, show.3d=FALSE)
##D 
##D plot(hv,plot.function.additional=function(i,j){
##D   points( x=iris[iris$Species=="setosa",i],
##D           y=iris[iris$Species=="setosa",j],col='purple') 
##D   })
## End(Not run)



