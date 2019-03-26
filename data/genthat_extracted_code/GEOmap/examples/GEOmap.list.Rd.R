library(GEOmap)


### Name: GEOmap.list
### Title: GEOmap to list
### Aliases: GEOmap.list
### Keywords: misc

### ** Examples


data(coastmap)
SEL=which(coastmap$STROKES$nam=='CUBA')
G = GEOmap.list(coastmap, SEL=SEL )

###  Lat-Lon of Cuba
G$LL






