library(mets)


### Name: fast.pattern
### Title: Fast pattern
### Aliases: fast.pattern

### ** Examples

X <- matrix(rbinom(100,1,0.5),ncol=4)
fast.pattern(X)

X <- matrix(rbinom(100,3,0.5),ncol=4)
fast.pattern(X,categories=4)



