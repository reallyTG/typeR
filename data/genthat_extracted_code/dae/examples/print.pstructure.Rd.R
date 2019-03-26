library(dae)


### Name: print.pstructure
### Title: Prints a pstructure.object
### Aliases: print.pstructure
### Keywords: array projector

### ** Examples

## Generate a data.frame with 4 factors, each with three levels, in standard order
ABCD.lay <- fac.gen(list(A = 3, B = 3, C = 3, D = 3))

## create a pstructure object based on the formula ((A*B)/C)*D
ABCD.struct <- pstructure.formula(~ ((A*B)/C)*D, data =ABCD.lay)

## print the object either using the Method function, the generic function or show
print.pstructure(ABCD.struct)
print(ABCD.struct)
ABCD.struct



