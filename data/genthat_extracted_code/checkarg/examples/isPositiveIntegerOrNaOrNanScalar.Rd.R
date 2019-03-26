library(checkarg)


### Name: isPositiveIntegerOrNaOrNanScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isPositiveIntegerOrNaOrNanScalar

### ** Examples

isPositiveIntegerOrNaOrNanScalar(2)
   # returns TRUE (argument is valid)
isPositiveIntegerOrNaOrNanScalar("X")
   # returns FALSE (argument is invalid)
#isPositiveIntegerOrNaOrNanScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanScalar(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isPositiveIntegerOrNaOrNanScalar("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isPositiveIntegerOrNaOrNanScalar(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




