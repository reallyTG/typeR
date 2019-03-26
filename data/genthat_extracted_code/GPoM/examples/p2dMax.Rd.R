library(GPoM)


### Name: p2dMax
### Title: p2dMax : provides the maximum polynomial degree 'dMax' given the
###   number of variables 'nVar' and the number of possible polynomial
###   terms 'pMax'.
### Aliases: p2dMax

### ** Examples

#############
# Example 1 #
#############
# Maximum polynomial degree ?
# number of variables:
nVar <- 3
# size of the polynomial vector:
pMax <- 10
# The maximal polynomial degree used for coding the polynomial is:
p2dMax(nVar,pMax)

#############
# Example 2 #
#############
# for pMax = 462 and nVar = 6, then dMax is:
p2dMax(6,462)
# indeed:
length(poLabs(nVar=6, dMax=5))




