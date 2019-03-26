library(RNetLogo)


### Name: RNetLogo-package
### Title: Provides an interface to the agent-based modelling platform
###   NetLogo
### Aliases: RNetLogo-package RNetLogo
### Keywords: NetLogo agent-based individual-based

### ** Examples

## Not run: 
##D library(RNetLogo)
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D nl.jarname <- "netlogo-6.0.0.jar"
##D NLStart(nl.path, nl.jarname=nl.jarname)
##D model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""))
##D NLCommand("setup")
##D NLDoCommand(10, "go")
##D burned <- NLReport("burned-trees")
##D print(burned)
##D NLQuit()
## End(Not run)



