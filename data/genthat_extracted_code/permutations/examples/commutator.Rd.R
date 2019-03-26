library(permutations)


### Name: commutator
### Title: Group-theoretic commutator and group action
### Aliases: commutator

### ** Examples


x <- rperm(10,7)
y <- rperm(10,8)
z <- rperm(10,9)

uu <- 
commutator(commutator(x,y),z^x) *
commutator(commutator(z,x),y^z) *
commutator(commutator(y,z),x^y) 

stopifnot(all(is.id(uu)))  # this is the  Hall-Witt identity




