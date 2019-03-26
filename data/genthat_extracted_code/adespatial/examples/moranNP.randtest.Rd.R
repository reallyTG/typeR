library(adespatial)


### Name: moranNP.randtest
### Title: Function to compute positive and negative parts of Moran's index
###   of spatial autocorrelation
### Aliases: moranNP.randtest
### Keywords: spatial

### ** Examples

if(require("ade4", quietly = TRUE)  & require("spdep", quiet = TRUE)){
data(mafragh)
tests <- moranNP.randtest(mafragh$env[,1], nb2listw(mafragh$nb),
 alter = "two-sided", p.adjust.method = "holm")
tests
moran.randtest(mafragh$env[,1], nb2listw(mafragh$nb))$obs
sum(tests$obs)
}




