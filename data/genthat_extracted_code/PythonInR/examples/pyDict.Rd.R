library(PythonInR)


### Name: pyDict
### Title: Create a virtual Python dictionary
### Aliases: pyDict

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
if ( pyIsConnected() ){
pyExec('myPyDict = {"a":1, "b":2, "c":3}')
## create a virtual Python dictionary for an existing dictionary
myDict <- pyDict("myPyDict")
myDict["a"]
myDict["a"] <- "set the key"
myDict
## allowed keys are
myDict['string'] <- 1
myDict[3L] <- "long"
myDict[5] <- "float"
myDict[c("t", "u", "p", "l", "e")] <- "tuple"
myDict
## NOTE: Python does not make a difference between a float key 3 and a long key 3L
myDict[3] <- "float"
myDict
## create a new Python dict and virtual dict
myNewDict <- pyDict('myNewDict', list(p=2, y=9, r=1))
myNewDict
}



