library(permutations)


### Name: id
### Title: The identity permutation
### Aliases: id is.id is.id.cycle is.id_single_cycle is.id.list is.id.word

### ** Examples

is.id(id)

as.word(id)  # weird

x <- rperm(10,4)
x[3] <- id
is.id(x*inverse(x))



