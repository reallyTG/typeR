library(checkarg)


### Name: isNumberOrNaOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNaOrNanVectorOrNull

### ** Examples

isNumberOrNaOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isNumberOrNaOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isNumberOrNaOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNaOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNaOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




