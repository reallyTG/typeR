library(IBrokers)


### Name: eWrapper
### Title: eWrapper Closure For Message Processing
### Aliases: eWrapper eWrapper.MktData.CSV eWrapper.RealTimeBars
###   eWrapper.RealTimeBars.CSV eWrapper.data eWrapper.MktDepth.CSV
### Keywords: utilities

### ** Examples

myWrapper <- eWrapper()

str(myWrapper)

# remove tickPrice action
myWrapper$tickPrice <- function(msg, timestamp, file, ...) {}

# add new tickPrice action
myWrapper$tickPrice <- function(msg, timestamp, file, ...) { cat("tickPrice",msg) }

# add new data into the object, and retrieve
myWrapper$assign.Data("myData", 1010)
myWrapper$get.Data("myData")

## Not run: 
##D tws <- twsConnect()
##D reqMktData(tws, twsSTK("SBUX"))
##D reqMktData(tws, twsSTK("SBUX"), eventWrapper=myWrapper)
##D twsDisconnect(tws)
## End(Not run)



