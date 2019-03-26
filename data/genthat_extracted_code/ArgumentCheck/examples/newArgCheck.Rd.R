library(ArgumentCheck)


### Name: addError
### Title: Argument Checking
### Aliases: addError addMessage addWarning finishArgCheck newArgCheck

### ** Examples

## Not run: 
##D #* This example is taken from the discussion of argument checking at
##D #* http://www.r-bloggers.com/programming-with-r---checking-function-arguments/
##D cylinder.volume <- function(height, radius){
##D   Check <- newArgCheck()
##D   if (missing(height)){
##D     addError("A value for 'height' was not provided",
##D              Check)
##D   } else{
##D     if (height < 0)
##D       addError("'height' must be a non-negative number",
##D                Check)
##D   }
##D 
##D   if (missing(height)){
##D     addError("A value for 'radius' was not provided",
##D              Check)
##D   } else {
##D     if (radius < 0)
##D       addError("'radius' must be a non-negative number",
##D                Check)
##D   }
##D 
##D   if (!missing(height) & !missing(radius)){
##D     if (height < radius)
##D       addWarning("When 'height' < 'radius', you have a short, awkward looking cylinder",
##D                  Check)
##D   }
##D 
##D   finishArgCheck(Check)
##D 
##D   pi * radius^2 * height
##D }
##D 
##D cylinder.volume()
##D cylinder.volume(height = -3)
##D cylinder.volume(height = 3, radius = -2)
##D cylinder.volume(height = 3, radius=2)
##D cylinder.volume(height = -8, radius = 4)
## End(Not run)



