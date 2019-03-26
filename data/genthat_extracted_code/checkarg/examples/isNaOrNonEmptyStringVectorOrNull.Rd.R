library(checkarg)


### Name: isNaOrNonEmptyStringVectorOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrNonEmptyStringVectorOrNull

### ** Examples

isNaOrNonEmptyStringVectorOrNull("X")
   # returns TRUE (argument is valid)
isNaOrNonEmptyStringVectorOrNull(1)
   # returns FALSE (argument is invalid)
#isNaOrNonEmptyStringVectorOrNull(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrNonEmptyStringVectorOrNull("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNaOrNonEmptyStringVectorOrNull(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNaOrNonEmptyStringVectorOrNull(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




