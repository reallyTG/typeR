library(RSEIS)


### Name: PLOT.SEISN
### Title: Plot Seismic Section
### Aliases: PLOT.SEISN
### Keywords: hplot

### ** Examples


data("GH")
m  <-  match( GH$STNS,    GH$stafile$name)
LATS  <-  GH$stafile$lat[m]
LONS  <-  GH$stafile$lon[m]
dees  <-  rdistaz( GH$pickfile$LOC$lat, GH$pickfile$LOC$lon, LATS, LONS)

sel  <-  which(GH$COMPS=="V")
sel  <-  sel[order(dees$dist[sel])]


###   set up good colors
pcols  <-  seiscols(GH)

### select only vertical components

PLOT.SEISN(GH, sel=sel)

GH$units  <-  rep("m/s", times=length(GH$KNOTES))
GH$pcols  <-  pcols


######  simple plot of GH structure
YN  <-  PLOT.SEISN(GH, WIN=c(5,12))

######  a color must be provided for all traces.
######  simple plot of GH structure, with selection and colors

YN  <-  PLOT.SEISN(GH, WIN=c(5,12), sel=sel, COL=rainbow(length(sel)) )


####   alternating Y axes
 YN  <-  PLOT.SEISN(GH, WIN=c(5,12) ,  dt=GH$dt[sel], sel=sel, sfact=1 ,
notes=GH$KNOTES[sel], YAX =3, UNITS = TRUE ,labs = GH$units[sel],
COL=pcols    , TIT="test")


#### Y  axes on same side
 YN  <-  PLOT.SEISN(GH, WIN=c(5,12) ,  dt=GH$dt[sel], sel=sel, sfact=1 ,
notes=GH$KNOTES[sel], YAX =2, UNITS = TRUE ,labs = GH$units[sel],
COL=pcols    , TIT="test")











