library(checkarg)


### Name: isStrictlyPositiveNumberOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrInfScalar

### ** Examples

isStrictlyPositiveNumberOrInfScalar(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




