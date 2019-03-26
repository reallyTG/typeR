library(PythonInR)


### Name: pyCall
### Title: Call a callable Python object from within R
### Aliases: pyCall

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
pyCall("sum", args=list(1:3))

## define a new function with the name fun
pyExec('
def fun(**kwargs):
    return([(key, value) for key, value in kwargs.items()])
')
pyCall("fun", kwargs=list(a=1, f=2, x=4))



