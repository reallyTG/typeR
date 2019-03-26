library(arulesSequences)


### Name: SPcontrol-class
### Title: Class "SPcontrol" - cSPADE Control Parameters
### Aliases: SPcontrol-class coerce,NULL,SPcontrol-method
###   coerce,list,SPcontrol-method coerce,SPcontrol,character-method
###   coerce,SPcontrol,data.frame-method coerce,SPcontrol,list-method
###   coerce,SPcontrol,vector-method format,SPcontrol-method
###   initialize,SPcontrol-method show,SPcontrol-method
### Keywords: classes

### ** Examples

## coerce from list 
p <- as(list(verbose = TRUE), "SPcontrol")
p

## coerce to
as(p, "vector")
as(p, "data.frame")



