library(checkarg)


### Name: isIntegerOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNaOrNanVectorOrNull

### ** Examples

isIntegerOrNaOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isIntegerOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNaOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNaOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




