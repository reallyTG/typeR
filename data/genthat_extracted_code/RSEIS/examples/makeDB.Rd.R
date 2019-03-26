library(RSEIS)


### Name: makeDB
### Title: Create a seismic Waveform Database
### Aliases: makeDB FmakeDB
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D #####  set directory
##D path <- '/home/lees/Site/Santiaguito/SG09'
##D pattern <- "R0*"
##D 
##D ###   get DB information
##D XDB  <-  makeDB(path, pattern, kind =1)
##D 
##D ##### select a station
##D usta <- "CAL"
##D acomp <- "V"
##D 
##D #####   extract 24 hours worht of data
##D JJ <- getseis24(DB, 2009, 2, usta, acomp, kind = 1)
##D 
##D 
##D #####  plot 24 hours worth of data
##D 
##D pjj <- plotseis24(JJ, dy=1/18, FIX=24, SCALE=0,
##D FILT=list(ON=FALSE, fl=0.05 , fh=20.0, type="BP", proto="BU"),
##D RCOLS=c(rgb(0.2, .2, 1), rgb(.2, .2, .2))  )
##D 
##D 
##D ###  window a small portion on 24 hour display
##D w <- winseis24(pjj)
##D 
##D ###  open a new window
##D X11()
##D VNE <- c("V", "N", "E")
##D ###  IJK <- c("I", "J", "K")
##D 
##D gsta <- c("CAL", "KAM", "DOM",  "LAV")
##D 
##D ucomp<-VNE
##D 
##D ###  or:   ucomp<-IJK
##D 
##D ###   set epoch day and get the times
##D  eday <- EPOCHday(w$yr, jd = w$jd, origyr = DB$origyr)
##D 
##D ##  using epoch day, set times for beginning and end of window
##D         at1 <- eday$jday + (w$hr[1])/24
##D         at2 <- eday$jday + (w$hr[2])/24
##D ###  extract data from the data base:
##D         GH <- Mine.seis(at1, at2, DB, gsta, ucomp)
##D 
##D ###  show data:
##D         swig(GH)
##D 
## End(Not run)





