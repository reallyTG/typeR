library(umx)


### Name: umxAlgebra
### Title: A simple wrapper for mxAlgebra with name as the first parameter
###   for more readable compact code.
### Aliases: umxAlgebra

### ** Examples

x = umxAlgebra("circ", 2 * pi)
class(x$formula)
x = mxAlgebra(name = "circ", 2 * pi)
class(x$formula) # "call"




