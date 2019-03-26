library(checkarg)


### Name: isNaOrNonEmptyStringScalarOrNull
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNaOrNonEmptyStringScalarOrNull

### ** Examples

isNaOrNonEmptyStringScalarOrNull("X")
   # returns TRUE (argument is valid)
isNaOrNonEmptyStringScalarOrNull(1)
   # returns FALSE (argument is invalid)
#isNaOrNonEmptyStringScalarOrNull(1, stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNaOrNonEmptyStringScalarOrNull("X", default = "Y")
   # returns "X" (the argument, rather than the default, since it is not NULL)
#isNaOrNonEmptyStringScalarOrNull(1, default = "Y")
   # throws exception with message defined by message and argumentName parameters
isNaOrNonEmptyStringScalarOrNull(NULL, default = "Y")
   # returns "Y" (the default, rather than the argument, since it is NULL)




