library(PythonInR)


### Name: pyFunction
### Title: creates a virtual Python function
### Aliases: pyFunction

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
if ( pyIsConnected() ){
pySum <- pyFunction("sum")
pySum(1:3)
}



