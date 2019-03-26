library(RSEIS)


### Name: pickseis24
### Title: Pick zooms on 24 hour display
### Aliases: pickseis24
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D dev.new(width=8, height=12)
##D dev.new(width=12, height=8)
##D 
##D dev.set(2)
##D usta <- "CAL"
##D acomp <- "V"
##D JJ <- getseis24(DB, 2009, 2, usta, acomp, kind = 1)
##D pjj <- plotseis24(JJ, dy=1/18, FIX=24, SCALE=1, FILT=list(ON=FALSE,
##D fl=0.05 , fh=20.0, type="BP", proto="BU"), RCOLS=c(rgb(0.2, .2, 1),
##D rgb(.2, .2, .2))  )
##D 
##D ucomp <- c("V", "N", "E", "I")
##D 
##D pickseis24(pjj, DB, usta, ucomp )
##D 
##D 
## End(Not run)





