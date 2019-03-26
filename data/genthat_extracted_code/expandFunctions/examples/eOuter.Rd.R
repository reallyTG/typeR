library(expandFunctions)


### Name: eOuter
### Title: Extend outer product.
### Aliases: eOuter

### ** Examples

# This implements a function similar to ePow
# FIXME: change ePow to use eOuter!!!
eOuter(1:6,0:2,FUN = `^`)
# Other functions of columns
eOuter(1:10,0:3,FUN = lagshift,lagMax=3,pad=NA)
# FIXME: Make function to allow polynomials to be used:
# eOuter(1:10,1:3,FUN = glaguerre.polynomials, alpha=0.5)



