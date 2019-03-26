library(acopula)


### Name: depfun
### Title: Dependence function of Extreme-Value copula
### Aliases: depfun dep1 depGalambos depGumbel depHuslerReiss depMax
###   depTawn depCC depGCC ldepPartition3D
### Keywords: Pickands' dependence function Extreme-Value copula EV copula

### ** Examples

## the following gives the same definition list
depGumbel()
depfun("Gumbel")

## any list item can be modified upon function call
depGumbel(parameters=2.2,upper=10)

## general convex combination of 5 basic depfuns that arise from 
## partitioning method for 3 dimensions; it results in 
## (3x5)-parametric Pickand's dependence function definition list
depGCC(depfun=ldepPartition3D(), dim = 3)



