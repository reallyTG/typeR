library(PythonInR)


### Name: pyGet
### Title: Gets Python objects by name and transforms them into R objects
### Aliases: pyGet

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
## get a character of length 1
pyGet("__name__")
## get a character of length 1 > 1
pyGet("sys.path")
## get a list
pyGet("sys.path", simplify = FALSE)
## get a PythonInR_List
x <- pyGet("sys.path", autoTypecast = FALSE)
x
class(x)

## get an object where no specific transformation to R is defined
## this example also shows the differnces between pyGet and pyGet0
pyExec("import datetime")
## pyGet creates a new Python variable where the return value of pyGet is
## stored the name of the new reference is stored in x$py.variableName.
x <- pyGet("datetime.datetime.now().time()")
x
class(x)
x$py.variableName
## pyGet0 never creates a new Python object, objects which can be transformed 
## to R objects are transformed. For all other objects an PythonInR_Object is created.
y <- pyGet0("datetime.datetime.now().time()")
y
## An important difference is that the evaluation of x always will return the same
## time, the evaluation of y always will give the new time.



