library(statnet.common)


### Name: statnetStartupMessage
### Title: Construct a "standard" startup message to be printed when the
###   package is loaded.
### Aliases: statnetStartupMessage
### Keywords: utilities

### ** Examples


## Not run: 
##D .onAttach <- function(lib, pkg){
##D   sm <- statnetStartupMessage("ergm", friends=c("statnet","ergm.count","tergm"), nofriends=FALSE)
##D   if(!is.null(sm)) packageStartupMessage(sm)
##D }
## End(Not run)



