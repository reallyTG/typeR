library(randtoolbox)


### Name: coll.test.sparse
### Title: the Collision test
### Aliases: coll.test.sparse
### Keywords: htest

### ** Examples

# (1) poisson approximation
#
coll.test.sparse(runif)

# (2) exact distribution
#
coll.test.sparse(SFMT, lenSample=2^7, segments=2^5, tdim=2, nbSample=10)

#A generator with too uniform distribution (too small number of collisions)
#produces p-values close to 1
set.generator(name="congruRand", mod="2147483647", mult="742938285", incr="0", seed=1)
coll.test.sparse(runif, lenSample=300000, segments=50000, tdim=2)

#Park-Miller generator has too many collisions and produces small p-values
set.generator(name="congruRand", mod="2147483647", mult="16807", incr="0", seed=1)
coll.test.sparse(runif, lenSample=300000, segments=50000, tdim=2)




