library(adehabitatHR)


### Name: CharHull
### Title: Estimation of the Home Range by Delaunay Triangulation method
### Aliases: CharHull
### Keywords: spatial

### ** Examples


## Not run: 
##D data(puechabonsp)
##D lo<-puechabonsp$relocs[,1]
##D      
##D ## Home Range Estimation
##D res <- CharHull(lo)
##D 
##D ## Displays the home range
##D plot(res)
##D  
##D ## Computes the home range size
##D MCHu2hrsize(res)
##D 
##D ## Computes the 95 percent home range
##D ver <- getverticeshr(res)
##D ver
##D plot(ver)
## End(Not run)




