library(spgwr)


### Name: ggwr.sel
### Title: Crossvalidation of bandwidth for generalised GWR
### Aliases: ggwr.sel ggwr.cv.adapt.f ggwr.cv.f
### Keywords: spatial

### ** Examples

## No test: 
if (require(rgdal)) {
xx <- readOGR(system.file("shapes/sids.shp", package="spData")[1])
bw <- ggwr.sel(SID74 ~ I(NWBIR74/BIR74) + offset(log(BIR74)), data=xx,
  family=poisson(), longlat=TRUE)
bw
}
## End(No test)



