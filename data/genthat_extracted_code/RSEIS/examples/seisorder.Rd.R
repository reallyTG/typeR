library(RSEIS)


### Name: seisorder
### Title: Order seismic traces
### Aliases: seisorder
### Keywords: misc

### ** Examples


data(GH)
staf <- GH$stafile

################   get the distances from the source to the stations
d1  <- GreatDist(GH$pickfile$LOC$lon, GH$pickfile$LOC$lat,
              staf$lon, staf$lat)

###  staf has the names of the stations already, so insert the order via
###                       dist
staf$dist <- d1$dkm

sorder <- seisorder(GH, staf, VNE= c("V", "N", "E"))

## Not run: 
##D swig(GH, sel=sorder)
## End(Not run)




