library(RNetLogo)


### Name: NLDoReport
### Title: Repeats a command and a reporter in the referenced NetLogo
###   instance a defined number of times.
### Aliases: NLDoReport
### Keywords: interface NLDoReport RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""))
##D NLCommand("setup")
##D burned10 <- NLDoReport(10, "go", "burned-trees")
##D initburned10 <- NLDoReport(10, "go", c("initial-trees","burned-trees"), 
##D                 as.data.frame=TRUE, df.col.names=c("initial","burned"))
##D str(initburned10)
## End(Not run)



