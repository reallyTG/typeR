library(RNetLogo)


### Name: NLDoReportWhile
### Title: Repeats execution of a command and a reporter in the referenced
###   NetLogo instance while a conditional reporter returns 'TRUE'.
### Aliases: NLDoReportWhile
### Keywords: interface NLDoReportWhile RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""))
##D NLCommand("setup")
##D burnedLower2200 <- NLDoReportWhile("burned-trees < 2200", "go", 
##D                                    "burned-trees")
##D str(burnedLower2200)
## End(Not run)



