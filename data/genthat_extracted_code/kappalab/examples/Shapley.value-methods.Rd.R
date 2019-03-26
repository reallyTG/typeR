library(kappalab)


### Name: Shapley.value-methods
### Title: The Shapley value
### Aliases: Shapley.value Shapley.value-methods
###   Shapley.value,Mobius.set.func-method
###   Shapley.value,card.set.func-method Shapley.value,set.func-method
### Keywords: methods

### ** Examples

## a set function
mu <- set.func(c(0:13/13,1,1))

## the Shapley value
Shapley.value(mu)

## the efficiency property should be satisfied
sum(Shapley.value(mu))

## a similar example using a Mobius.set.func object
a <- Mobius(mu)
Shapley.value(a)

## a similar example using a card.set.func object
mu <- upper.capacity(6)
Shapley.value(mu)
## the efficiency property should be satisfied
Shapley.value(mu)*6



