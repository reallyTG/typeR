library(PythonInR)


### Name: pyList
### Title: Creates a virtual Python list
### Aliases: pyList

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
if ( pyIsConnected() ){
pyExec('myPyList = [1, 2, 5, "Hello R!"]')
# create a virtual Python list for an existing list
myList <- pyList("myPyList")
myList[0]
myList[1] <- "changed"
myList
# create a new Python list and virtual list
myNewList <- pyList('myNewList', list(1:3, 'Hello Python'))
myNewList[1]
myNewList$append(4L)
ls(myNewList)
## NOTE: Indexing which can not be interpreted as correct R
##       syntax should be provided as a character string.
myNewList['::2'] 
}



