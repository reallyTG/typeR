library(dmutate)


### Name: covset
### Title: Covobj and covset objects.
### Aliases: covset new_covobj print.covobj as.list,covobj-method
###   as.list,covset-method print.covset covset rvset as.covset

### ** Examples


obj <- new_covobj(Y[0,80] ~ rnorm(20,50))

obj

as.list(obj)

a <- Y ~ runif(0,1)
b <- Z ~ rbeta(1,1)

set <- covset(a,b)

set

as.list(set)




