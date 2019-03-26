library(RSEIS)


### Name: plotseis24
### Title: Plot 24 hours of seismic data
### Aliases: plotseis24
### Keywords: misc

### ** Examples


## Not run: 
##D JJ <- getseis24(DB, 2008, 366, usta, acomp, kind = 1)
##D 
##D ### show with no scaling
##D pjj <- plotseis24(JJ, dy=1/18, FIX=24, SCALE=0, FILT=list(ON=FALSE,
##D fl=0.05 , fh=20.0, type="BP", proto="BU"), RCOLS=c(grey(0.8) , grey(0.8)), add=FALSE  )
##D 
##D 
##D pjj <- plotseis24(JJ, dy=1/18, FIX=24, SCALE=1, FILT=list(ON=FALSE,
##D fl=0.05 , fh=20.0, type="BP", proto="BU"), RCOLS=c(rgb(0.2, .2, 1),
##D rgb(.2, .2, .2)), add=TRUE  )
##D 
##D 
##D 
##D 
## End(Not run)





