library(checkarg)


### Name: isStrictlyPositiveIntegerOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrInfScalar

### ** Examples

isStrictlyPositiveIntegerOrInfScalar(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




