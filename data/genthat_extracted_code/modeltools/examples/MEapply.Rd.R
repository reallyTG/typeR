library(modeltools)


### Name: MEapply
### Title: Apply functions to Data in Object of Class "ModelEnv"
### Aliases: MEapply,ModelEnv-method MEapply
### Keywords: methods

### ** Examples

data("iris")
me <- ModelEnvFormula(Species+Petal.Width~.-1, data=iris,
                      subset=sample(1:150, 10))

me1 <- MEapply(me, FUN=list(designMatrix=scale,
                            response=function(x) sapply(x, as.numeric)))

me@get("designMatrix")
me1@get("designMatrix")



