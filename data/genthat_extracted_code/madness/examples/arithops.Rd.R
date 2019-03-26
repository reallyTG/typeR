library(madness)


### Name: arithops
### Title: Basic Arithmetic Operations.
### Aliases: arithops +,madness,missing-method +,madness-class
###   -,madness,missing-method -,madness-class +,madness,madness-method
###   +,madness,madness-class +,madness,numeric-method
###   +,madness,numeric-class +,madness,array-method +,madness,array-class
###   +,numeric,madness-method +,numeric,madness-class
###   +,array,madness-method +,array,madness-class -,madness,madness-method
###   -,madness,madness-class -,madness,numeric-method
###   -,madness,numeric-class -,madness,array-method -,madness,array-class
###   -,numeric,madness-method -,numeric,madness-class
###   -,array,madness-method -,array,madness-class *,madness,madness-method
###   *,madness,madness-class *,madness,numeric-method
###   *,madness,numeric-class *,madness,array-method *,madness,array-class
###   *,numeric,madness-method *,numeric,madness-class
###   *,array,madness-method *,array,madness-class /,madness,madness-method
###   /,madness,madness-class /,madness,numeric-method
###   /,madness,numeric-class /,madness,array-method /,madness,array-class
###   /,numeric,madness-method /,numeric,madness-class
###   /,array,madness-method /,array,madness-class ^,madness,madness-method
###   ^,madness,madness-class ^,madness,numeric-method
###   ^,madness,numeric-class ^,madness,array-method ^,madness,array-class
###   ^,numeric,madness-method ^,numeric,madness-class
###   ^,array,madness-method ^,array,madness-class

### ** Examples

set.seed(123)
y <- array(rnorm(3*3),dim=c(3,3))
dy <- matrix(rnorm(length(y)*2),ncol=2)
dx <- crossprod(matrix(rnorm(ncol(dy)*100),nrow=100))
obj0 <- madness(val=y,vtag='y',xtag='x',dvdx=dy,varx=dx)
z <- array(rnorm(3*3),dim=c(3,3))

anobj <- + obj0
anobj <- - obj0
anobj <- 6 - obj0
anobj <- 1 + obj0
anobj <- obj0 - 3
anobj <- z + obj0 
anobj <- obj0 - z

obj1 <- obj0 ^ 2
anobj <- (0.3 * obj0) + (5.1 * obj1)

anobj <- 2 ^ obj0
anobj <- obj1 ^ obj0
anobj <- obj1 / obj0
anobj <- z / obj0




