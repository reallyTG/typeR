library(mixpack)


### Name: rmixnorm_solution
### Title: Random sample generated from an specified gaussian mixture
###   model.
### Aliases: rmixnorm_solution

### ** Examples

require(mclust)
mod1 = Mclust(iris[,1:4])
rmixnorm_solution(10, mod1)



