library(GSIF)


### Name: FAO.SoilProfileCollection-class
### Title: A class for FAO SoilProfileCollection
### Aliases: FAO.SoilProfileCollection-class FAO.SoilProfileCollection
###   munsell
### Keywords: classes

### ** Examples

library(aqp)
library(sp)

LONWGS84 = 3.90
LATWGS84 = 7.50 
UHDICM = 0
LHDICM = 30
SOURCEID = "ISRIC:NG0017"
SOURCEDB = "AfSP DB"
SPDFAO = "3"
TEXMHT = "SCL"
DCOMNS = "7.5YR_3_2"

sp1 <- new("FAO.SoilProfileCollection", 
  depthcols=c('UHDICM','LHDICM'),
  metadata=soil.vars, 
  horizons=data.frame(SOURCEID, UHDICM, LHDICM, TEXMHT, DCOMNS),
  site=data.frame(SOURCEID, SPDFAO, SOURCEDB),
  sp=SpatialPoints(data.frame(LONWGS84, LATWGS84), 
     proj4string=CRS("+proj=longlat +datum=WGS84"))
)
str(sp1)



