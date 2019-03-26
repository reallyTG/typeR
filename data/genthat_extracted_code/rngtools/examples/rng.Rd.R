library(rngtools)


### Name: getRNG
### Title: Getting/Setting RNGs
### Aliases: getRNG hasRNG nextRNG setRNG

### ** Examples

#--- getRNG ---
# get current RNG settings
s <- getRNG()
head(s)
showRNG(s)

# get RNG from a given single numeric seed
s1234 <- getRNG(1234)
head(s1234)
showRNG(s1234)
# this is identical to the RNG seed as after set.seed()
set.seed(1234)
identical(s1234, .Random.seed)
# but if num.ok=TRUE the object is returned unchanged
getRNG(1234, num.ok=TRUE)

# single integer RNG data = encoded kind 
head(getRNG(1L))

# embedded RNG data
s <- getRNG(list(1L, rng=1234))
identical(s, s1234)
 

#--- hasRNG ---
# test for embedded RNG data
hasRNG(1)
hasRNG( structure(1, rng=1:3) )
hasRNG( list(1, 2, 3) )
hasRNG( list(1, 2, 3, rng=1:3) )
hasRNG( list(1, 2, 3, noise=list(1:3, rng=1)) )


#--- nextRNG ---
head(nextRNG())
head(nextRNG(1234))
head(nextRNG(1234, ndraw=10))


#--- setRNG ---

obj <- list(x=1000, rng=123)
setRNG(obj)
rng <- getRNG()
runif(10)
set.seed(123)
rng.equal(rng)





