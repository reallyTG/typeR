library(FRK)


### Name: nres
### Title: Return the number of resolutions
### Aliases: nres nres,Basis-method nres_basis,Basis-method
###   nres,TensorP_Basis-method nres_basis,Basis-method nres,SRE-method
###   nres_SRE,SRE-method

### ** Examples

library(sp)
set.seed(1)
d <- data.frame(lon = runif(n=1000,min = -179, max = 179),
                lat = runif(n=1000,min = -90, max = 90),
                z = rnorm(5000))
coordinates(d) <- ~lon + lat
proj4string(d)=CRS("+proj=longlat")

### Now create basis functions on sphere
G <- auto_basis(manifold = sphere(),data=d,
                nres = 2,prune=15,
                type = "bisquare",
                subsamp = 20000)
nres(G)



