library(ParamHelpers)


### Name: Param
### Title: Create a description object for a parameter.
### Aliases: Param makeNumericParam makeNumericVectorParam makeIntegerParam
###   makeIntegerVectorParam makeLogicalParam makeLogicalVectorParam
###   makeDiscreteParam makeDiscreteVectorParam makeFunctionParam
###   makeUntypedParam makeCharacterParam makeCharacterVectorParam

### ** Examples

makeNumericParam("x",lower = -1, upper = 1)
makeNumericVectorParam("x", len = 2)
makeDiscreteParam("y", values = c("a","b"))
makeCharacterParam("z")



