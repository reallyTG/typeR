library(itertools2)


### Name: ichain
### Title: Iterator that chains multiple arguments together into a single
###   iterator
### Aliases: ichain

### ** Examples

it <- ichain(1:3, 4:5, 6)
as.list(it)

it2 <- ichain(1:3, levels(iris$Species))
as.list(it2)



