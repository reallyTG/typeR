library(RSEIS)


### Name: FILT.SEISN
### Title: Filter Traces
### Aliases: FILT.SEISN
### Keywords: misc

### ** Examples


##   Fdef = choosfilt()
Fdef  <-  list(ON=FALSE, fl=0.5, fh=7.0, type="BP", proto="BU", RM=FALSE, zp=TRUE )
data("GH")
sel <-  which(GH$COMPS=="V")

sel  <-  1:3
 KF  <-  FILT.SEISN(GH, sel = sel, FILT=Fdef)
swig(KF, sel=sel, SHOWONLY=0)





