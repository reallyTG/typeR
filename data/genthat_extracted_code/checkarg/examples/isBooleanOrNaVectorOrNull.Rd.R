library(checkarg)


### Name: isBooleanOrNaVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isBooleanOrNaVectorOrNull

### ** Examples

isBooleanOrNaVectorOrNull(FALSE)
   # returns TRUE (argument is valid)
isBooleanOrNaVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isBooleanOrNaVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanOrNaVectorOrNull(FALSE, default = TRUE)
   # returns FALSE (the argument, rather than the default, since it is not NULL)
#isBooleanOrNaVectorOrNull("X", default = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanOrNaVectorOrNull(NULL, default = TRUE)
   # returns TRUE (the default, rather than the argument, since it is NULL)




