library(RSEIS)


### Name: Mine.seis
### Title: Mine a seismic data base to extract secions of time limited data
### Aliases: Mine.seis
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D #######   Assume  k97DB already exists
##D for(i in 1:24)
##D {
##D at1 <- 232+(i-1)/24
##D at2 <- at1+1/24
##D 
##D GH <- Mine.seis(at1, at2, k97DB, "kar1", c("4", "1") )
##D w <- swig(GH)
##D if(identical(w$but, "QUIT"))break
##D }
##D 
##D 
##D 
##D 
## End(Not run)







