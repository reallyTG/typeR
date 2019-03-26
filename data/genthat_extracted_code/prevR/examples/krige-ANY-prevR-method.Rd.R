library(prevR)


### Name: krige,ANY,prevR-method
### Title: Spatial interpolation (kriging and inverse distance weighting)
###   for objects of class prevR.
### Aliases: idw idw,ANY,prevR-method idw,prevR-method idw-methods krige
###   krige,ANY,prevR-method krige,prevR-method krige-methods
### Keywords: smooth spatial

### ** Examples

  ## Not run: 
##D     dhs <- rings(fdhs, N = c(100,200,300,400,500))
##D     radius.N300 <- krige('r.radius', dhs, N = 300, nb.cells = 200)
##D     prev.krige <- krige(r.wprev ~ 1, dhs, N = c(100, 300, 500))
##D     spplot(prev.krige, c('r.wprev.N100.RInf', 'r.wprev.N300.RInf', 'r.wprev.N500.RInf'))
##D   
## End(Not run)




