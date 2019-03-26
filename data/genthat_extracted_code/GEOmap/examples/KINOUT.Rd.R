library(GEOmap)


### Name: KINOUT
### Title: Map inside-outside
### Aliases: KINOUT
### Keywords: misc

### ** Examples

library(geomapdata)
data(worldmap)
data(coastmap)
L = list(lon=c(163.59, 182.95), lat=c(-48.998, -32.446))


k = KINOUT(worldmap,L, 2)

###  which strokes are these?

 print( worldmap$STROKES$nam[k] )


k = KINOUT(coastmap,L, 2)

 print( coastmap$STROKES$nam[k] )


testmap =  GEOmap.Extract(coastmap,k, INOUT="in" )

 plotGEOmap(testmap)






