library(checkarg)


### Name: isStrictlyPositiveIntegerOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveIntegerOrNanOrInfScalar

### ** Examples

isStrictlyPositiveIntegerOrNanOrInfScalar(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveIntegerOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveIntegerOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanOrInfScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveIntegerOrNanOrInfScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveIntegerOrNanOrInfScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




