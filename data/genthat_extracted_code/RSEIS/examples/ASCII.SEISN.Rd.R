library(RSEIS)


### Name: ASCII.SEISN
### Title: ASCII RSEIS data dump
### Aliases: ASCII.SEISN
### Keywords: misc

### ** Examples



## Not run: 
##D data("GH")
##D tempd = tempdir()
##D sel <-  which(GH$COMPS == "V" & GH$STNS=="CE1"  , destdir=tempd )
##D ASCII.SEISN(GH, sel = 1, HEAD = TRUE)
## End(Not run)



