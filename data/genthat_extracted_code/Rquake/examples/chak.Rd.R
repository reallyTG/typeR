library(Rquake)


### Name: chak
### Title: View Picked Data
### Aliases: chak
### Keywords: misc

### ** Examples


## Not run: 
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
## End(Not run)




