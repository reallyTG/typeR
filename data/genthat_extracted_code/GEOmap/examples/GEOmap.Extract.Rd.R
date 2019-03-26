library(GEOmap)


### Name: GEOmap.Extract
### Title: Extract from GEOmap
### Aliases: GEOmap.Extract fastExtract GEOmap.limit
### Keywords: misc

### ** Examples

data(coastmap)
SEL=which(coastmap$STROKES$nam=="AMERICAS")
NSAMER =  GEOmap.Extract(coastmap,SEL, INOUT="in" )
plotGEOmap(NSAMER)




