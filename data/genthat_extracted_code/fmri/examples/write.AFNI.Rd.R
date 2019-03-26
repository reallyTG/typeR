library(fmri)


### Name: write.AFNI
### Title: I/O functions
### Aliases: write.AFNI
### Keywords: IO utilities

### ** Examples

 ## Not run: 
##D write.AFNI("afnifile", array(as.integer(65526*runif(10*10*10*20)),
##D      c(10,10,10,20)), c("signal"), note="random data",
##D      origin=c(0,0,0), delta=c(4,4,5), idcode="unique ID")
## End(Not run)
 write.AFNI("afnifile", array(as.integer(65526*runif(10*10*10*20)),
     c(10,10,10,20)), header=list(HISTORY_NOTE="random data",
     ORIGIN=c(0,0,0), DELTA=c(4,4,5), IDCODE_STRING="unique ID"),taxis=FALSE)



