library(RSEIS)


### Name: filterstamp
### Title: Make Filter Stamp
### Aliases: filterstamp
### Keywords: misc

### ** Examples


fl <- c(0.01, 2)
fh <- c(10, 20)
type <- "BP"
filterstamp(fl, fh, type)

FILT<-list(ON=TRUE, fl=1/2, fh=12, type="HP", proto="BU")
filterstamp(FILT)

FILT<-list(ON=TRUE, fl=1/2, fh=12, type="BP", proto="BU")
filterstamp(FILT)

FILT<-list(ON=TRUE, fl=1/2, fh=12, type="LP", proto="BU")
filterstamp(FILT)






