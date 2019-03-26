library(commandr)


### Name: Stage-class
### Title: Stage: Abstract Step in a Pipeline
### Aliases: class:Stage Stage-class Stage defaultMethod
###   defaultMethod,Stage-method defaultMethod,character-method
###   defaultMethod,missing-method defaultMethod<-
###   defaultMethod<-,Stage-method inType outType role role,Stage-method

### ** Examples

setStage("average", "Average Numbers", intype = "numeric")
setProtocol("mean", fun = mean, parent = "average")
setProtocol("median", fun = median, parent = "average")

stage <- Stage("average")
stage

defaultMethod(stage)
defaultMethod(stage) <- "median"
defaultMethod(stage)



