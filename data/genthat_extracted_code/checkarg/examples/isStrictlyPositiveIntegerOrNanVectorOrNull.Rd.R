library(checkarg)


### Name: isStrictlyPositiveIntegerOrNanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNanVectorOrNull

### ** Examples

isStrictlyPositiveIntegerOrNanVectorOrNull(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanVectorOrNull(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNanVectorOrNull("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanVectorOrNull(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




