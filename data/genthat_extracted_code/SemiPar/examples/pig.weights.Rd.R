library(SemiPar)


### Name: pig.weights
### Title: Pig weight data
### Aliases: pig.weights
### Keywords: datasets

### ** Examples

library(SemiPar)
data(pig.weights)
library(lattice)
xyplot(weight~num.weeks,data=pig.weights,groups=id.num,type="b")



