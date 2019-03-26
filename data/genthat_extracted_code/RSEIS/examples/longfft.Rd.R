library(RSEIS)


### Name: longfft
### Title: Long FFT Spectrogram
### Aliases: longfft longpstart longreset
### Keywords: misc

### ** Examples


## Not run: 
##D ###  output directory
##D setwd("/home/lees/MARIO_TUNG/LONGFFT")
##D 
##D ###  2 color palettes
##D p1 <- Gcols(plow=5, phi=0,  N=100, pal="topo.colors", mingray=0.8)
##D p2 <- Gcols(plow=5, phi=0,  N=100, pal="rainbow", mingray=0.8)
##D 
##D ###   one station, vertical component
##D longfft(DB, DAYS=c(148:156) , HRS=1:24 ,
##D sta="BBIL", comp=c("BHZ") , NPP=6 , CSCALE=FALSE, 
##D pal = list(p1=p1, p2=p2), PS=TRUE ,  kind = 2,
##D Iendian=1, BIGLONG=FALSE )
##D 
##D ###   one station, infrasound
##D longfft(DB, DAYS=c(148:156) , HRS=1:24 , sta="BBIL",
##D comp=c("BDF") , NPP=6 , CSCALE=FALSE, 
##D pal = list(p1=p2, p2=p1), PS=TRUE ,  kind = 2,
##D Iendian=1, BIGLONG=FALSE )
##D 
##D ###  one station, both vertical and infrasound, alternating
##D longfft(DB, DAYS=c(148:156) , HRS=1:24 , sta="BBIL",
##D comp=c("BHZ", "BDF") , NPP=6 , CSCALE=FALSE, 
##D pal = list(p1=p2, p2=p1), PS=TRUE ,  kind = 2,
##D Iendian=1, BIGLONG=FALSE )
##D 
##D 
##D 
##D 
##D 
## End(Not run)





