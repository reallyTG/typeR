library(PythonInR)


### Name: BEGIN.Python
### Title: Execute Python interactively from within R
### Aliases: BEGIN.Python

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
## Not run: 
##D code <-
##D BEGIN.Python()
##D import os
##D os.getcwd()
##D dir(os)
##D x = 3**3
##D for i in xrange(10):
##D     if (i > 5):
##D         print(i)
##D 
##D END.Python
##D ## NOTE: BEGIN.Python returns the successfully executed code as character.
##D cat(code, sep="\n")
##D pyGet0("x")
## End(Not run)



