library(PythonInR)


### Name: pyTuple
### Title: Creates a virtual Python tuple
### Aliases: pyTuple

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
if ( pyIsConnected() ){
pyExec('myPyTuple = (1, 2, 5, "Hello R!")')
# create a virtual Python tuple for an existing tuple
myTuple <- pyTuple("myPyTuple")
myTuple[0]
tryCatch({myTuple[1] <- "should give an error since tuple are not mutable"},
         error = function(e) print(e))
myTuple
# create a new Python tuple and virtual tuple
newTuple <- pyTuple('myNewTuple', list(1:3, 'Hello Python'))
newTuple[1]
}



