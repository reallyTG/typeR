library(FRK)


### Name: auto_basis
### Title: Automatic basis-function placement
### Aliases: auto_basis

### ** Examples

## Not run: 
##D library(sp)
##D library(ggplot2)
##D 
##D ### Create a synthetic dataset
##D set.seed(1)
##D d <- data.frame(lon = runif(n=1000,min = -179, max = 179),
##D                 lat = runif(n=1000,min = -90, max = 90),
##D                 z = rnorm(5000))
##D coordinates(d) <- ~lon + lat
##D proj4string(d)=CRS("+proj=longlat +ellps=sphere")
##D 
##D ### Now create basis functions over sphere
##D G <- auto_basis(manifold = sphere(),data=d,
##D                 nres = 2,prune=15,
##D                 type = "bisquare",
##D                 subsamp = 20000)
##D 
##D ### Plot
##D \dontrun{show_basis(G,draw_world())}
## End(Not run)



