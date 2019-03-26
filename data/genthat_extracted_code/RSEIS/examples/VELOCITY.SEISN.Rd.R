library(RSEIS)


### Name: VELOCITY.SEISN
### Title: Velocity Seismogram
### Aliases: VELOCITY.SEISN
### Keywords: misc

### ** Examples


## Not run: 
##D Kal  <-  PreSet.Instr()
##D Majorevent   <-  250+8/24+2250/(24*3600)
##D 
##D at1  <-  Majorevent - 1/24
##D at2  <-  Majorevent + 1/24
##D 
##D 
##D TH  <-   Mine.seis(at1, at2, DB99, NULL, NULL , kind = 1, Iendian=1,
##D BIGLONG=FALSE, CHOP=TRUE, verbose=FALSE)
##D inst  <-  rep(0, length(TH$STNS))
##D inst[TH$COMPS %in% c("V", "N", "E")]  <-  1
##D inst[TH$STNS=="krm2" &  TH$COMPS %in% c("V", "N", "E")]  <-  2
##D inst[TH$STNS=="krm0" &  TH$COMPS %in% c("V", "N", "E")]  <-  2
##D 
##D VH  <-     VELOCITY.SEISN(TH, sel = 1:length(TH$JSTR), inst = 1,
##D Kal = Kal, FILT = list(ON = FALSE, fl = 1/30, fh = 7,
##D type = "HP", proto = "BU"))
##D 
##D 
## End(Not run)






