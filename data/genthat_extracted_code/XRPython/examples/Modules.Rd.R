library(XRPython)


### Name: Modules
### Title: Import a Python module or add a directory to the Python Search
###   Path
### Aliases: Modules pythonImport pythonAddToPath

### ** Examples

## Not run: 
##D ## How to search from a local directory, import a function from a file there
##D ## and call the function.
##D ## Including the evaluator argument causes the path change and import to happen
##D ## right now, not in a package being loaded
##D ev <- RPython()
##D pythonAddToPath("/Users/me/myPython/", package = "",
##D                 evaluator = ev)
##D pythonImport("funEx", "foo", evaluator = ev)
##D pythonCall("foo", 1.1, 1.2)
## End(Not run)



