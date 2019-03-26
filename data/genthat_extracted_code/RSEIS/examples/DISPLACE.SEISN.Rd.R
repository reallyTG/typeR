library(RSEIS)


### Name: DISPLACE.SEISN
### Title: Displacement seismogram
### Aliases: DISPLACE.SEISN
### Keywords: misc

### ** Examples


## Not run: 
##D Majorevent   <-  250+8/24+2250/(24*3600)
##D 
##D at1  <-  Majorevent - 1/24
##D at2  <-  Majorevent + 1/24
##D 
##D 
##D TH  <-   Mine.seis(at1, at2, DB99, NULL, NULL , kind = 1,
##D  Iendian=1, BIGLONG=FALSE, CHOP=TRUE, verbose=FALSE)
##D inst  <-  rep(0, length(TH$STNS))
##D inst[TH$COMPS %in% c("V", "N", "E")]  <-  1
##D inst[TH$STNS=="krm2" &  TH$COMPS %in% c("V", "N", "E")]  <-  2
##D inst[TH$STNS=="krm0" &  TH$COMPS %in% c("V", "N", "E")]  <-  2
##D 
##D 
##D DH  <-   DISPLACE.SEISN(TH, sel = which(inst>0) , inst = inst,
##D Kal = Kal, FILT = list(ON = FALSE, fl = 1/200, fh = 7,
##D type = "BP", proto = "BU"))
##D 
##D   SOUT  <-   swig(DH, PADDLAB=c("CENTER", "fspread", "HALF", "PREV"),
##D filters=thefilts  )
##D 
##D 
## End(Not run)






