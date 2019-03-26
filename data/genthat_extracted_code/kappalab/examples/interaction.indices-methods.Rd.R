library(kappalab)


### Name: interaction.indices-methods
### Title: The Shapley interaction indices
### Aliases: interaction.indices interaction.indices-methods
###   interaction.indices,Mobius.set.func-method
###   interaction.indices,card.set.func-method
###   interaction.indices,set.func-method
### Keywords: methods

### ** Examples

## a set function
mu <- set.func(c(-7:6,6,6))

## the associated interaction indices
interaction.indices(mu)


## a similar example using a Mobius.set.func object
a <- Mobius(mu)
interaction.indices(a)

## a similar example using a card.set.func object
mu <- upper.capacity(6)
interaction.indices(mu)



