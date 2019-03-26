library(checkarg)


### Name: isBooleanOrNaScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isBooleanOrNaScalarOrNull

### ** Examples

isBooleanOrNaScalarOrNull(FALSE)
   # returns TRUE (argument is valid)
isBooleanOrNaScalarOrNull("X")
   # returns FALSE (argument is invalid)
#isBooleanOrNaScalarOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanOrNaScalarOrNull(FALSE, default = TRUE)
   # returns FALSE (the argument, rather than the default, since it is not NULL)
#isBooleanOrNaScalarOrNull("X", default = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanOrNaScalarOrNull(NULL, default = TRUE)
   # returns TRUE (the default, rather than the argument, since it is NULL)




