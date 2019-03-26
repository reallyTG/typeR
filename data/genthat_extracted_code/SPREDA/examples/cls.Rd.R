library(SPREDA)


### Name: cls
### Title: Mixed primal-dual bases algorithm for estimation of parameters
###   with restriction.
### Aliases: cls

### ** Examples

y<-sort(rnorm(100, 10, 2))
x<-cbind(runif(100, 1, 3), sort(rnorm(100, 3, 1)))
res<-cls(y, x)



