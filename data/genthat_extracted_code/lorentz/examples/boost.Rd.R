library(lorentz)


### Name: boost
### Title: Lorentz transformations
### Aliases: boost rot thomas Thomas 'Thomas rotation' wigner Wigner
###   'Wigner rotation' precession boostfun decompose pureboost orthog
###   is.consistent.boost

### ** Examples

boost(as.3vel(c(0.4,-0.2,0.1)))

u <- r3vel(1)
v <- r3vel(1)
w <- r3vel(1)

boost(u) - solve(boost(-u))  # should be zero

boost(u) %*% boost(v)   # not a pure boost (not symmetrical)
boost(u+v)  # not the same!
boost(v+u)  # also not the same!

u+v  # returns a three-velocity


boost(u) %*% boost(v) %*% boost(w)  # associative, no brackets needed
boost(u+(v+w))  # not the same!
boost((u+v)+w)  # also not the same!


rot(u,v)
rot(v,u)    # transpose (=inverse) of rot(u,v)


rot(u,v,FALSE) %*% boost(v) %*% boost(u)
boost(u+v)     # should be the same.


orthog(boost(u) %*% boost(v)) - rot(u,v,FALSE)  # should be small
pureboost(boost(v) %*% boost(u)) - boost(u+v)   # should be small



## Define a random-ish Lorentz transform
L <- boost(r3vel(1)) %*% boost(r3vel(1)) %*% boost(r3vel(1))

## check it:

is.consistent.boost(L)     # should be TRUE
## Decompose it:
U <- orthog(L)
P <- pureboost(L)

L - U %*% P              # should be small (L = UP)
crossprod(U)               # should be identity (U is orthogonal)
P - t(P)                   # should be small (P is symmetric)
is.consistent.4vel(P[,1])  # should be TRUE 






