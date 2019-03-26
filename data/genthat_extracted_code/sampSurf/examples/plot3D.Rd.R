library(sampSurf)


### Name: plot3D
### Title: Interactive 3D Plot of Objects From Package "sampSurf"
### Aliases: plot3D plot3D-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #
##D # create a buffered tract, sampling surface, and then display...
##D #
##D bufftr = bufferedTract(10, Tract(c(x=100,y=100),cellSize=0.5,units='metric'))
##D ss = sampSurf(25,bufftr,iZone='sausageIZ',plotRadius=4)
##D require(rgl)
##D plot3D(ss)
## End(Not run)



