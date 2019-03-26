library(utiml)


### Name: create_subset
### Title: Create a subset of a dataset
### Aliases: create_subset

### ** Examples

## Create a dataset with the 20 first examples and the 7 first attributes
small.toy <- create_subset(toyml, seq(20), seq(7))

## Create a random dataset with 50 examples and 5 attributes
random.toy <- create_subset(toyml, sample(100, 50), sample(10, 5))



