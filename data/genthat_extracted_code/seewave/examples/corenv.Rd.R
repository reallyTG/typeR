library(seewave)


### Name: corenv
### Title: Cross-correlation between two time wave envelopes
### Aliases: corenv
### Keywords: dplot ts

### ** Examples

## Not run: 
##D data(orni)
##D # cross-correlation between two echemes of a cicada song
##D wave1<-cutw(orni,f=22050,from=0.3,to=0.4,plot=FALSE)
##D wave2<-cutw(orni,f=22050,from=0.58,to=0.68,plot=FALSE)
##D corenv(wave1,wave2,f=22050)
## End(Not run)



