library(startupmsg)


### Name: myStartupUtilities
### Title: Example functions to utilities for start-up messages
### Aliases: mystartupMessage mySMHandler buildStartupMessage
### Keywords: utilities

### ** Examples

## a set of test messages

msg <- "Note that you may set global options by options() --- cf. ?\"options\"."

## issuing of messages controlled by options()
buildStartupMessage(pkg="stats", msg) 
suppressStartupMessages(buildStartupMessage(pkg="stats", msg) )
suppressMessages(buildStartupMessage(pkg="stats", msg))
onlytypeStartupMessages(buildStartupMessage(pkg="stats", msg),
          atypes="version")

getOption("StartupBanner")
buildStartupMessage(pkg="stats", msg)

options("StartupBanner"="off");getOption("StartupBanner")
buildStartupMessage(pkg="stats", msg)

options("StartupBanner"="complete");getOption("StartupBanner")
buildStartupMessage(pkg="stats", msg)

options("StartupBanner"="something else");getOption("StartupBanner")
buildStartupMessage(pkg="stats", msg)

options("StartupBanner"=NULL);getOption("StartupBanner")
buildStartupMessage(pkg="stats", msg)


MNH <- "https://www.r-project.org/"
buildStartupMessage(pkg="stats", msg, packageHelp=TRUE, MANUAL=MNH)
## not quite a manual, but to illustrate the principle:
## "demo/nlm.R" as a "manual": to be system-independent the 
## first call is to be preferred 
buildStartupMessage(pkg="stats", msg, packageHelp=TRUE, MANUAL=c("demo","nlm.R"))
###  works, too, (i.e. is equivalent) under Linux and Windows (at least):
buildStartupMessage(pkg="stats", msg, packageHelp=TRUE, MANUAL="demo/nlm.R")




