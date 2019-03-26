library(npExact)


### Name: npStochinUnpaired
### Title: A test of a stochastic inequality given two independent samples
### Aliases: npStochinUnpaired
### Keywords: data inequality stochastic unpaired

### ** Examples


data(french)
origin <- french$french.origin
rest <- french$rest.of.civil
npStochinUnpaired(origin, rest, ignoreNA = TRUE)




