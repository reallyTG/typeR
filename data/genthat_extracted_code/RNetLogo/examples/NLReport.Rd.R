library(RNetLogo)


### Name: NLReport
### Title: Reports a value or list of values
### Aliases: NLReport
### Keywords: interface NLReport RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""))
##D NLCommand("setup")
##D NLDoCommand(10, "go")
##D noburned <- NLReport("burned-trees")
##D str(noburned)
## End(Not run)



