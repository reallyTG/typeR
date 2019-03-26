library(checkarg)


### Name: isIntegerOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isIntegerOrNanVector

### ** Examples

isIntegerOrNanVector(2)
   # returns TRUE (argument is valid)
isIntegerOrNanVector("X")
   # returns FALSE (argument is invalid)
#isIntegerOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isIntegerOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isIntegerOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




