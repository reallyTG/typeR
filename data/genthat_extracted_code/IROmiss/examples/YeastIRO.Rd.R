library(IROmiss)


### Name: YeastIRO
### Title: Learning gene regulatory networks for Yeast Cell Expression
###   Data.
### Aliases: YeastIRO
### Keywords: YeastIRO

### ** Examples

## No test: 

library(IROmiss)
library(huge)
data(yeast)
## long time ##
A <- YeastIRO(yeast, alpha1 = 0.05, alpha2 = 0.01, alpha3 = 0.01, iteration = 30, warm = 20)
## plot gene regulatory network by our estimated adjacency matrix.
huge.plot(A)

## End(No test)



         



