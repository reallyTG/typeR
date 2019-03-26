library(PythonInR)


### Name: pyObject
### Title: Creates a virtual Python object
### Aliases: pyObject

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
if ( pyIsConnected() ){
pyExec("import os")
os <- pyObject("os", regFinalizer = FALSE)
ls(os)
## To show again the difference between pyGet and pyGet0.
os1 <- pyGet0("os") ## has no finalizer
os2 <- pyGet("os")  ## has a finalizer
os$py.variableName
os1$py.variableName
os2$py.variableName
}



