library(nlr)


### Name: nl.robfuncs
### Title: Robust Loss functions provided for 'nlr'.
### Aliases: nl.robfuncs
### Keywords: datasets

### ** Examples

data(nl.robfuncs)
## maybe str(nl.robfuncs) ; plot(nl.robfuncs) ...
## the object are mostly stored in fnc slot which is function, it can be called
## directly as a function.
plot(seq(-6,6,length.out=30),nl.robfuncs[[1]]$fnc(seq(-6,6,length.out=30)),type="l",
xlab="t",ylab="rho",main=nl.robfuncs[[1]]$name)



