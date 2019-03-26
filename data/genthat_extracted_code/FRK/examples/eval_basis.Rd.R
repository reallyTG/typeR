library(FRK)


### Name: eval_basis
### Title: Evaluate basis functions
### Aliases: eval_basis eval_basis,Basis,matrix-method
###   eval_basis,Basis-matrix-method
###   eval_basis,Basis,SpatialPointsDataFrame-method
###   eval_basis,Basis-SpatialPointsDataFrame-method
###   eval_basis,Basis,SpatialPolygonsDataFrame-method
###   eval_basis,Basis-SpatialPolygonsDataFrame-method
###   eval_basis,Basis,STIDF-method eval_basis,Basis-STIDF-method
###   eval_basis,TensorP_Basis,matrix-method
###   eval_basis,TensorP_Basis-matrix-method
###   eval_basis,TensorP_Basis,STIDF-method
###   eval_basis,TensorP_Basis-STIDF-method
###   eval_basis,TensorP_Basis,STFDF-method
###   eval_basis,TensorP_Basis-STFDF-method

### ** Examples

library(sp)

### Create a synthetic dataset
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

### Now evaluate basis functions at origin
S <- eval_basis(G,matrix(c(0,0),1,2))



