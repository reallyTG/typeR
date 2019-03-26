library(RNetLogo)


### Name: NLDoCommand
### Title: Repeats execution of a command in the referenced NetLogo
###   instance a defined number of times.
### Aliases: NLDoCommand
### Keywords: interface NLDoCommand RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""))
##D NLCommand("setup")
##D NLDoCommand(10, "go")
## End(Not run)



