library(RNetLogo)


### Name: NLDoCommandWhile
### Title: Repeats a command in the referenced NetLogo instance while a
###   reporter returns 'TRUE'.
### Aliases: NLDoCommandWhile
### Keywords: interface NLDoCommandWhile RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
##D NLLoadModel(paste(nl.path,model.path,sep=""))
##D NLCommand("setup")
##D NLDoCommandWhile("burned-trees < 500", "go")
## End(Not run)



