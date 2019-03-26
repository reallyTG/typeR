library(EasyMx)


### Name: emxGeneticFactorComponent
### Title: Creates component for a Genetic Factor Model
### Aliases: emxGeneticFactorComponent

### ** Examples

   
# Create genetic factor A component for DZ twins
require(EasyMx)
xvars <- paste0('x', 1:4)
acomp <- emxGeneticFactorComponent(xvars, 'A', hvalues=c(1, .5, 1))




