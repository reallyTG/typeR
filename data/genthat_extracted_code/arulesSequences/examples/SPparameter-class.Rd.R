library(arulesSequences)


### Name: SPparameter-class
### Title: Class "SPparameter" - cSPADE Mining Parameters
### Aliases: SPparameter-class coerce,NULL,SPparameter-method
###   coerce,list,SPparameter-method coerce,SPparameter,character-method
###   coerce,SPparameter,data.frame-method coerce,SPparameter,list-method
###   coerce,SPparameter,vector-method format,SPparameter-method
###   initialize,SPparameter-method show,SPparameter-method
### Keywords: classes

### ** Examples

## coerce from list 
p <- as(list(maxsize = NULL, maxwin = 5), "SPparameter")
p

## coerce to
as(p, "vector")
as(p, "data.frame")



