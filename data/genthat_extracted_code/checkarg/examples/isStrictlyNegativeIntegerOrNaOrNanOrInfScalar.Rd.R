library(checkarg)


### Name: isStrictlyNegativeIntegerOrNaOrNanOrInfScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyNegativeIntegerOrNaOrNanOrInfScalar

### ** Examples

isStrictlyNegativeIntegerOrNaOrNanOrInfScalar(-2)
   # returns TRUE (argument is valid)
isStrictlyNegativeIntegerOrNaOrNanOrInfScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyNegativeIntegerOrNaOrNanOrInfScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanOrInfScalar(-2, default = -1)
   # returns -2 (the argument, rather than the default, since it is not NULL)
#isStrictlyNegativeIntegerOrNaOrNanOrInfScalar("X", default = -1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyNegativeIntegerOrNaOrNanOrInfScalar(NULL, default = -1)
   # returns -1 (the default, rather than the argument, since it is NULL)




