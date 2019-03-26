library(startupmsg)


### Name: StartupUtilities
### Title: Utilities for start-up messages
### Aliases: startupmsg infoShow TOBEDONE NEWS readVersionInformation
###   readURLInformation pointertoNEWS StartupMessage startupPackage
###   startupType startupEndline startupMessage suppressStartupMessages
###   onlytypeStartupMessages
### Keywords: utilities

### ** Examples

## a set of test messages
several.messages<-function() {
startupMessage("this is a type 'version' startup message", pkg="PKG")
startupMessage("this is a type 'information' startup message", 
                pkg="PKG", type="information")
message("this is an ordinary message")}

## issuing of messages with different wrappers
several.messages()
suppressStartupMessages(several.messages())
suppressMessages(several.messages())
onlytypeStartupMessages(several.messages(),atypes=c("version","notabene"))

##Example by Seth Falcon:
## Here is a test function
doit <- function() {
    several.messages()
    return(123)
}

## Here is an example message handler.  Here, you could write messages
## to a file, send them as email to your friends or enemies, etc.
## For the example, we'll just prepend 'MSG:'
msgLogger <- function(m) {
             types<-paste("(", startupType(m),"):", sep="")
             cat(paste("MSG: ",types, conditionMessage(m)), "\n")
             }

## Finally, call the doit function and customize how messages are
## handled.
withCallingHandlers(doit(),
                    StartupMessage=function(m) {
                        invokeRestart("custom", m, msgLogger)
                    })
### reading information file utilities
readVersionInformation("stats")
readURLInformation("stats")
## for packages with URL file see e.g. dse1
pointertoNEWS("stats") ## no NEWS file;
NEWS("stats") ## no NEWS file; 
## for packages with NEWS file see e.g. randomForest, distr



