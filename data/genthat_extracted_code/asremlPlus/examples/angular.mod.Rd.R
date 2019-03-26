library(asremlPlus)


### Name: angular.mod
### Title: Applies the modified angular transformation to a vector of
###   counts.
### Aliases: angular.mod
### Keywords: manip

### ** Examples

n <-25
y <- rbinom(10, n, 0.5)
y <- c(y,0,n)
p.ang.mod <- angular.mod(y, n)



