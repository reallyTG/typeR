library(OpenMx)


### Name: mxBounds
### Title: Create MxBounds Object
### Aliases: mxBounds

### ** Examples

#Create lower and upper bounds for parameters 'A' and 'B'
bounds <- mxBounds(c('A', 'B'), 3, 5)

#Create a lower bound of zero for a set of variance parameters
varianceBounds <- mxBounds(c('Var1', 'Var2', 'Var3'), 0)



