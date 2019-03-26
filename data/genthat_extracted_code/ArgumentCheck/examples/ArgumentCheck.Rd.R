library(ArgumentCheck)


### Name: ArgumentCheck
### Title: Improved Argument Check Communication
### Aliases: ArgumentCheck ArgumentCheck-package

### ** Examples

## Not run: 
##D #* This example is taken from the discussion of argument checking at
##D #* http://www.r-bloggers.com/programming-with-r---checking-function-arguments/
##D cylinder.volume <- function(height, radius){
##D   ArgCheck <- newArgCheck()
##D   ArgumentCheck::addError(missing(height),
##D            "A value for 'height' was not provided",
##D            ArgCheck)
##D   ArgumentCheck::addError(ifelse(!missing(height), height < 0, FALSE),
##D            "'height' must be a non-negative number",
##D            ArgCheck)
##D   ArgumentCheck::addError(missing(radius),
##D            "A value for 'radius' was not provided",
##D            ArgCheck)
##D   ArgumentCheck::addError(ifelse(!missing(radius), radius < 0, FALSE),
##D            "'radius' must be a non-negative number",
##D            ArgCheck)
##D 
##D   ArgumentCheck::addWarning(ifelse(!missing(height) & !missing(radius),
##D                     height < radius, FALSE),
##D              "When 'height' < 'radius', you have a short, awkward looking cylinder",
##D              ArgCheck)
##D 
##D ArgumentCheck::finishArgCheck(ArgCheck)
##D 
##D volume <- pi * radius^2 * height
##D volume
##D }
##D 
##D cylinder.volume()
##D cylinder.volume(height = -3)
##D cylinder.volume(height = 3, radius = -2)
##D cylinder.volume(height = 3, radius=2)
##D cylinder.volume(height = -8, radius = 4)
## End(Not run)



