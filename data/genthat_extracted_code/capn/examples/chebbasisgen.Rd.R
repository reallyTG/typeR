library(capn)


### Name: chebbasisgen
### Title: Generating Unidimensional Chebyshev polynomial (monomial) basis
### Aliases: chebbasisgen

### ** Examples

## Reef-fish example: see Fenichel and Abbott (2014)
data("GOM")
nodes <- chebnodegen(param$nodes,param$lowerK,param$upperK)
## An example of Chebyshev polynomial basis
chebbasisgen(nodes,20,0.1,1.5)
## The partial derivative of Chebyshev polynomial basis with the same function
chebbasisgen(nodes,20,0.1,1.5,1)



