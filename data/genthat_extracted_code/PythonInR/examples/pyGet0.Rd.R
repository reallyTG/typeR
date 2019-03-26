library(PythonInR)


### Name: pyGet0
### Title: Creates an R representation of an Python object
### Aliases: pyGet0

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
if ( pyIsConnected() ){
pyExec("import os")
os <- pyGet0("os")
os$getcwd()
os$sep
os$sep <- "Hello Python!"
pyExecp("os.sep")
}



