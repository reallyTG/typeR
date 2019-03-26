library(checkarg)


### Name: isNaOrStringScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrStringScalarOrNull

### ** Examples

isNaOrStringScalarOrNull("X")
   # returns TRUE (argument is valid)
isNaOrStringScalarOrNull(1)
   # returns FALSE (argument is invalid)
#isNaOrStringScalarOrNull(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrStringScalarOrNull("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNaOrStringScalarOrNull(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNaOrStringScalarOrNull(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




