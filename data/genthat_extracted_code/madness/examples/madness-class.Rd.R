library(madness)


### Name: madness-class
### Title: Madness Class.
### Aliases: madness-class initialize,madness-method
###   initialize,madness-class madness
### Keywords: differentiation multivariate

### ** Examples

obj <- new("madness", val=matrix(rnorm(10*10),nrow=10), dvdx=diag(100), xtag="foo", vtag="foo")
obj2 <- madness(val=matrix(rnorm(10*10),nrow=10), xtag="foo", vtag="foo^2")




