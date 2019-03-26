library(pkgmaker)


### Name: oneoffVariable
### Title: One-off Global Variables
### Aliases: oneoffVariable

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


x <- oneoffVariable(0)
# returns default value
x()
# assign a value
x(3)
# get the value
x()
# second call returns default value again 
x()
 



