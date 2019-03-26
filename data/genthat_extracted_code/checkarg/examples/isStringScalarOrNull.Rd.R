library(checkarg)


### Name: isStringScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStringScalarOrNull

### ** Examples

isStringScalarOrNull("X")
   # returns TRUE (argument is valid)
isStringScalarOrNull(1)
   # returns FALSE (argument is invalid)
#isStringScalarOrNull(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStringScalarOrNull("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isStringScalarOrNull(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isStringScalarOrNull(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




