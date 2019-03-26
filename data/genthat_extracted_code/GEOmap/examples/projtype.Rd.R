library(GEOmap)


### Name: projtype
### Title: List of Projection types
### Aliases: projtype
### Keywords: misc

### ** Examples

projtype()


proj = setPROJ(type = 1, LAT0 =23, LON0 = 35)

projtype(proj)

## or, for Kamchatka-Aleutians
LL=c(54.3861210149126,171.626386683545)

PROJ = setPROJ(type=2, LAT0=LL[1], LON0=LL[2], LATS=NULL, LONS=NULL, DLAT=NULL, DLON=NULL, FN =0)
projtype(PROJ)




