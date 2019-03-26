library(adespatial)


### Name: moran.randtest
### Title: Function to compute Moran's index of spatial autocorrelation
### Aliases: moran.randtest
### Keywords: spatial

### ** Examples


if(require("ade4", quietly = TRUE)  & require("spdep", quiet = TRUE)){
data(mafragh)
tests <- moran.randtest(mafragh$env, nb2listw(mafragh$nb))
tests
plot(tests)

}
  



