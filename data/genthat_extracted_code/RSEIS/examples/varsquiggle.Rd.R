library(RSEIS)


### Name: varsquiggle
### Title: Var-Squiggle Plot
### Aliases: varsquiggle
### Keywords: hplot

### ** Examples

data(GH)
m <- match( GH$STNS,    GH$stafile$name)
LATS <- GH$stafile$lat[m]
LONS <- GH$stafile$lon[m]
dees <- rdistaz( GH$pickfile$LOC$lat, GH$pickfile$LOC$lon, LATS, LONS)

sel <- which(GH$COMPS=="V")
sel <-  sel[order(dees$dist[sel])]

###  plot normal way:
swig(GH, sel=sel, WIN=c(5,10), SHOWONLY=TRUE)


###  plot with varsquiggle
varsquiggle(GH, sel=sel, WIN=c(5,10))





