library(RSurvey)


### Name: EditFunction
### Title: GUI: Function Editor
### Aliases: EditFunction
### Keywords: misc

### ** Examples

## Not run: 
##D   d <- list(x = 1:10, y = 10:1)
##D   Data("data.raw", d)
##D   cols <- list()
##D   cols[[1]] <- list(id = "X", index = 1, fun = "\"X\"")
##D   cols[[2]] <- list(id = "Y", index = 2, fun = "\"Y\"")
##D   cols[[3]] <- list(id = "New Variable", fun = "\"X\" + \"Y\"")
##D   EditFunction(cols, index = 3)
## End(Not run)




