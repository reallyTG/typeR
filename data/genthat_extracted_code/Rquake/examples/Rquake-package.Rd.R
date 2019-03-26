library(Rquake)


### Name: Rquake-package
### Title: Seismic Analysis of Earthquake Hypocenter determination
### Aliases: Rquake-package Rquake
### Keywords: package

### ** Examples


## Not run: 
##D 
##D 
##D lf = list.files(path="/Users/lees/Site/CHAC/PIX", pattern=".RDATA", full.names=TRUE)
##D 
##D for(i in 1:length(lf))
##D   {
##D fn = lf[i]
##D 
##D 
##D ret = chak(DBnov , gstas, gcomps , fn, stas, kind=2, Iendian=1, BIGLONG=FALSE)
##D 
##D   if(ret$but == "QUIT") break
##D   }
##D 
##D 
##D 
##D 
## End(Not run)






