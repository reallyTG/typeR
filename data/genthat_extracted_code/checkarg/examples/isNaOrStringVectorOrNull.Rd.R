library(checkarg)


### Name: isNaOrStringVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrStringVectorOrNull

### ** Examples

isNaOrStringVectorOrNull("X")
   # returns TRUE (argument is valid)
isNaOrStringVectorOrNull(1)
   # returns FALSE (argument is invalid)
#isNaOrStringVectorOrNull(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrStringVectorOrNull("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNaOrStringVectorOrNull(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNaOrStringVectorOrNull(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




