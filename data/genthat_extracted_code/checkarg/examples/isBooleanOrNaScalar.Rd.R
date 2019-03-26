library(checkarg)


### Name: isBooleanOrNaScalar
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isBooleanOrNaScalar

### ** Examples

isBooleanOrNaScalar(FALSE)
   # returns TRUE (argument is valid)
isBooleanOrNaScalar("X")
   # returns FALSE (argument is invalid)
#isBooleanOrNaScalar("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanOrNaScalar(FALSE, default = TRUE)
   # returns FALSE (the argument, rather than the default, since it is not NULL)
#isBooleanOrNaScalar("X", default = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanOrNaScalar(NULL, default = TRUE)
   # returns TRUE (the default, rather than the argument, since it is NULL)




