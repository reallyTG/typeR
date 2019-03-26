library(checkarg)


### Name: isNumberOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNanVectorOrNull

### ** Examples

isNumberOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isNumberOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




