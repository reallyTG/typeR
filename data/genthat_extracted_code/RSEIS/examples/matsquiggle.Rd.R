library(RSEIS)


### Name: matsquiggle
### Title: Matrix Seismic Record
### Aliases: matsquiggle
### Keywords: hplot

### ** Examples



data(GH)
m <- match( GH$STNS,    GH$stafile$name)
LATS <- GH$stafile$lat[m]
LONS <- GH$stafile$lon[m]
dees <- rdistaz( GH$pickfile$LOC$lat, GH$pickfile$LOC$lon, LATS, LONS)

sel <- which(GH$COMPS=="V")
sel <- sel[order(dees$dist[sel])]

###  plot normal way:
### swig(GH, sel=sel, WIN=c(5,10), SHOWONLY=TRUE)


###  plot with varsquiggle
### varsquiggle(GH, sel=sel, WIN=c(5,10))

ex <- seq(from=0, by=GH$dt[sel[1]], length=length(GH$JSTR[[sel[1]]]))
wx <- ex>=5 & ex<=10
XMAT <- matrix(ncol=length(sel), nrow=length(which(wx)))

for(i in 1:length(sel))
{
XMAT[,i] <-  GH$JSTR[[sel[i]]][wx]

}


matsquiggle(XMAT, GH$dt[sel[1]] , dist = dees$dist[sel] , thick = 1,
FLIP = FALSE)

axis(1)
axis(2)
title(xlab="Time, s", ylab="Distance, km")





