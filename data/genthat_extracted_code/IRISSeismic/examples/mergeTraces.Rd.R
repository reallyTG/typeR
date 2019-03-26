library(IRISSeismic)


### Name: mergeTraces
### Title: Merge multiple traces into a single trace
### Aliases: mergeTraces mergeTraces,Stream,character-method
###   mergeTraces,Stream,missing-method
### Keywords: methods

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2002-04-20", tz="GMT")
##D endtime <- as.POSIXct("2002-04-21", tz="GMT")
##D st4 <- getDataselect(iris,"US","OXF","","BHZ",starttime,endtime)
##D stm4 <- mergeTraces(st4)
##D 
##D # plot merged trace
##D plot(stm4@traces[[1]])
##D mtext(paste(length(st4@traces),"traces"), side=3, line=0.5, adj=0.05, cex=1.5)      
## End(Not run)



