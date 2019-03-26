library(checkarg)


### Name: isBooleanVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isBooleanVectorOrNull

### ** Examples

isBooleanVectorOrNull(FALSE)
   # returns TRUE (argument is valid)
isBooleanVectorOrNull("X")
   # returns FALSE (argument is invalid)
#isBooleanVectorOrNull("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanVectorOrNull(FALSE, default = TRUE)
   # returns FALSE (the argument, rather than the default, since it is not NULL)
#isBooleanVectorOrNull("X", default = TRUE)
   # throws exception with message defined by message and argumentName parameters
isBooleanVectorOrNull(NULL, default = TRUE)
   # returns TRUE (the default, rather than the argument, since it is NULL)




