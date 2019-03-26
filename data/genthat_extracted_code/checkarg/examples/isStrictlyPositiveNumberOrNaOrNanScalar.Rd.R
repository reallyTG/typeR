library(checkarg)


### Name: isStrictlyPositiveNumberOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isStrictlyPositiveNumberOrNaOrNanScalar

### ** Examples

isStrictlyPositiveNumberOrNaOrNanScalar(2)
   # returns TRUE (argument is valid)
isStrictlyPositiveNumberOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isStrictlyPositiveNumberOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isStrictlyPositiveNumberOrNaOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isStrictlyPositiveNumberOrNaOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




