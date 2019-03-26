library(kappalab)


### Name: entropy-methods
### Title: Normalized entropy of a capacity
### Aliases: entropy entropy-methods entropy,Mobius.capacity-method
###   entropy,capacity-method entropy,card.capacity-method
### Keywords: methods

### ** Examples

## a capacity
mu <- capacity(c(0,0,0:13))

## its Mobius transform
a <- Mobius(mu)

## their normalized entropy
entropy(mu)
entropy(a)

## similar examples with card.capacity objects
mu <- lower.capacity(4)
entropy(mu)
mu <- uniform.capacity(4)
entropy(mu)



