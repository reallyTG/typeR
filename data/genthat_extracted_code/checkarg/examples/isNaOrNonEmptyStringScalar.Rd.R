library(checkarg)


### Name: isNaOrNonEmptyStringScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrNonEmptyStringScalar

### ** Examples

isNaOrNonEmptyStringScalar("X")
   # returns TRUE (argument is valid)
isNaOrNonEmptyStringScalar(1)
   # returns FALSE (argument is invalid)
#isNaOrNonEmptyStringScalar(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrNonEmptyStringScalar("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNaOrNonEmptyStringScalar(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNaOrNonEmptyStringScalar(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




