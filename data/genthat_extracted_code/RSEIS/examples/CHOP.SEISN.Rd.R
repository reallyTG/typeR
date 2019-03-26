library(RSEIS)


### Name: CHOP.SEISN
### Title: CHOP SEISmic structure
### Aliases: CHOP.SEISN
### Keywords: misc

### ** Examples

data("GH")
sel <-  which(GH$COMPS=="V")

KF  <-  CHOP.SEISN(GH, sel=sel, WIN = c(0 , 5)  )

swig(KF, SHOWONLY=0)




