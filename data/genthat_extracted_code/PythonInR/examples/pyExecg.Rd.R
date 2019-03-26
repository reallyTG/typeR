library(PythonInR)


### Name: pyExecg
### Title: Executes multiple lines of python code and gets the output
### Aliases: pyExecg

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
if ( pyIsConnected() ){
# 1. assigns x to the global namespace
pyExec("x=4")
# 2. assigns y to the temp namespace
pyExecg("y=4", simplify=TRUE)
# 3. assign again to the temp namespace
pyExecg("
y=[i for i in range(1,4)]
x=[i for i in range(3,9)]
z=[i**2 for i in range(1,9)]
", returnValues=c("x", "z"), simplify=TRUE)
# 4. assign x to the temp namespace, x gets returned as vector
pyExecg("x=[i for i in range(0,5)]", simplify=TRUE)
# 5. assign x to the temp namespace, x gets returned as list
pyExecg("x=[i for i in range(0,5)]", simplify=FALSE)
# 6. x is still 4 since except assignment 1 all other assignments
#    took place in the temp namespace
pyPrint("x")
# 7. note y has never been assigned to the main namespace
"y" %in% pyDir()
# 8. since mergeNamespaces is TRUE PythonInR will try
#     to assign x to the main namespace but since override is
#     by default FALSE and x already exists in the main namespace
#     x will not be changed
pyExecg("x=10", simplify=TRUE, mergeNamespaces=TRUE)
# 9. there is no y in the main namespace therefore it can be assigned
pyExecg("y=10", simplify=TRUE, mergeNamespaces=TRUE)
pyPrint("x") # NOTE: x is still unchanged!
pyPrint("y") # NOTE: a value has been assigned to y!
# 10. since override is now TRUE the value of x will be changed in the
#      main namespace
pyExecg("x=10", simplify=TRUE, mergeNamespaces=TRUE, override=TRUE)
pyPrint("x") # NOTE: x is changed now!
# 11. get an object which can't be typecast to an R object
#     pyExecg does not transform these objects automatically
pyExec("import os")
z <- pyExecg("x = os")
os <- PythonInR:::pyTransformReturn(z[[1]])
os$getcwd()
}



