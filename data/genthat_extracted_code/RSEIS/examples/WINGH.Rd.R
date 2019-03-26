library(RSEIS)


### Name: WINGH
### Title: Window a GH structure and extract data
### Aliases: WINGH
### Keywords: misc

### ** Examples


## Not run: 
##D data(GH)
##D 
##D swig(GH, sel=which(GH$COMPS=="V" ))
##D 
##D 
##D jh = WINGH(GH, sel = which(GH$COMPS=="V" ), WIN = c(3.821281, 12.861820) )
##D 
##D swig(jh)
##D ## compare with:
##D swig(GH, sel=which(GH$COMPS=="V" ), WIN = c(3.821281, 12.861820))
##D 
##D 
##D 
## End(Not run)



