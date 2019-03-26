library(GEOmap)


### Name: GEOmap.cat
### Title: Concatenate Two GEOmaps
### Aliases: GEOmap.cat
### Keywords: misc

### ** Examples


data(coastmap)
CUBA = GEOmap.Extract(coastmap,90, INOUT="in" )

NSAMER =  GEOmap.Extract(coastmap,2, INOUT="in" )
AMAP = GEOmap.cat(CUBA, NSAMER)
plotGEOmap(AMAP )




