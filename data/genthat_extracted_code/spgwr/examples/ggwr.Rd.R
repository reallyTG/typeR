library(spgwr)


### Name: ggwr
### Title: Generalised geographically weighted regression
### Aliases: ggwr
### Keywords: spatial

### ** Examples

if (require(rgdal)) {
xx <- readOGR(system.file("shapes/sids.shp", package="spData")[1])
bw <- 144.4813
## Not run: 
##D bw <- ggwr.sel(SID74 ~ I(NWBIR74/BIR74) + offset(log(BIR74)), data=xx,
##D   family=poisson(), longlat=TRUE)
## End(Not run)
nc <- ggwr(SID74 ~ I(NWBIR74/BIR74) + offset(log(BIR74)), data=xx,
  family=poisson(), longlat=TRUE, bandwidth=bw)
nc
## Not run: 
##D nc <- ggwr(SID74 ~ I(NWBIR74/10000) + offset(log(BIR74)), data=xx,
##D   family=poisson(), longlat=TRUE, bandwidth=bw)
##D nc
##D nc <- ggwr(SID74 ~ I(NWBIR74/10000) + offset(log(BIR74)), data=xx,
##D   family=quasipoisson(), longlat=TRUE, bandwidth=bw)
##D nc
## End(Not run)
}



