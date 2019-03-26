library(RSEIS)


### Name: setwpix
### Title: Set Window Pix for swig
### Aliases: setwpix
### Keywords: misc

### ** Examples



data(KH)

orgtim <- c( 2005,214,7,1,10.7313152551651 )
tims <- c( 0,46.7119,102.438451,113.092049,123.54077 )
psecs  <-  NULL
nam  <-  NULL

aphases  <- NULL
sta  <- "9024"


for(j in 1:length(tims))
{
psecs  <-  c(psecs, tims[j]+orgtim[5])
nam  <-  c(nam, sta)
aphases  <-  c(aphases, paste(sep="", "K", j) )
}


pp  <-  setwpix(phase=aphases , col="blue", yr=orgtim[1], jd=orgtim[2],
hr=orgtim[3],  mi=orgtim[4], sec=psecs, dur=0, name=nam , comp="V")



W  <-  secdifL(KH$info, pp)

win  <-  c(min(W)-5, max(W)+5    )  
 swig(KH, APIX=pp, WIN=win , SHOWONLY=TRUE)





