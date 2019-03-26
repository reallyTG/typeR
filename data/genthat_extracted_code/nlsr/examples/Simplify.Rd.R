library(nlsr)


### Name: nlsSimplify
### Title: Functions to simplify expressions.
### Aliases: newSimplification nlsSimplify sysSimplifications isFALSE
###   isZERO isONE isMINUSONE isCALL
### Keywords: math

### ** Examples

nlsSimplify(quote(a + 0))
nlsSimplify(quote(exp(1)), verbose = TRUE)

nlsSimplify(quote(sqrt(a + b)))  # standard rule
myrules <- new.env(parent = sysSimplifications)
newSimplification(sqrt(a), TRUE, a^0.5, simpEnv = myrules)
nlsSimplify(quote(sqrt(a + b)), simpEnv = myrules)



