library(RSEIS)


### Name: markseis24
### Title: Mark 24 hour seismic display
### Aliases: markseis24
### Keywords: misc

### ** Examples


## Not run: 
##D ##  the database DB was constructed with makeDB
##D 
##D usta = "CAL"
##D acomp = "V"
##D 
##D iday = 2
##D 
##D ###   get one day's worth of data
##D JJ <- getseis24(DB, 2009, iday, "CAL", "V", kind = 1)
##D 
##D ###  plot day
##D pjj <- plotseis24(JJ, dy=1/18, FIX=24, SCALE=0,
##D FILT <- list(ON=FALSE, fl=0.5 , fh=20.0, type="BP", proto="BU"),
##D RCOLS=c(rgb(0.2, .2, 1), rgb(.2, .2, .2))  )
##D title(paste("CAL", "V"))
##D 
##D ###   set up pix
##D WINS2 <- win15
##D Apix <- WINS2$hr[seq(from=1, to=length(WINS2$hr), by=2) ]
##D dur <- (WINS2$hr[seq(from=2, to=length(WINS2$hr), by=2) ]-Apix)*3600
##D 
##D ## dur <- rep(0, times=length(Apix))
##D 
##D ##  mark the 24 hour plot
##D markseis24(pjj, pix =list(yr=rep(pjj$yr, length(Apix)),
##D  jd=rep(pjj$jd, length(Apix)) , hr=Apix, mi=rep(0, length(Apix)),
##D sec=rep(0, length(Apix)), dur=dur), col='red', ARROWS=FALSE )
##D 
##D 
##D 
##D 
## End(Not run)





