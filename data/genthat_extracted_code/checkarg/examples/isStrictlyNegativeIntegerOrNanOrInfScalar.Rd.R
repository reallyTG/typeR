library(checkarg)


### Name: isStrictlyNegativeIntegerOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNanOrInfScalar

### ** Examples

isStrictlyNegativeIntegerOrNanOrInfScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNanOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNanOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




