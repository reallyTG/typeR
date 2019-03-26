library(PythonInR)


### Name: pySet
### Title: assigns R objects to Python
### Aliases: pySet

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
pySet("x", 3)
pySet("M", diag(1,3))
pyImport("os")
pySet("name", "Hello os!", namespace="os")
## In some situations it can be beneficial to convert R lists or vectors
## to Python tuple instead of lists. One way to accomplish this is to change
## the class of the vector to "tuple".
y <- c(1, 2, 3)
class(y) <- "tuple"
pySet("y", y)
## pySet can also be used to change values of objects or dictionaries.
asTuple <- function(x) {
 class(x) <- "tuple"
 return(x)
}
pyExec("d = dict()")
pySet("myTuple", asTuple(1:10), namespace="d")
pySet("myList", as.list(1:5), namespace="d")



