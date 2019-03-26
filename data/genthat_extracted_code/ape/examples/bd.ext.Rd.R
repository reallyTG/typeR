library(ape)


### Name: bd.ext
### Title: Extended Version of the Birth-Death Models to Estimate
###   Speciation and Extinction Rates
### Aliases: bd.ext
### Keywords: models

### ** Examples

### An example from Paradis (2003) using the avian orders:
data(bird.orders)
### Number of species in each order from Sibley and Monroe (1990):
S <- c(10, 47, 69, 214, 161, 17, 355, 51, 56, 10, 39, 152,
       6, 143, 358, 103, 319, 23, 291, 313, 196, 1027, 5712)
bd.ext(bird.orders, S)
bd.ext(bird.orders, S, FALSE) # same than older versions



