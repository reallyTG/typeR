library(permutations)


### Name: size
### Title: Gets or sets the size of a permutation
### Aliases: size size.cycle size<-.cycle size.word size<- size<-.word
###   addcols
### Keywords: symbmath

### ** Examples

x <- rperm(10,8)
size(x)
size(x) <- 15

size(as.cycle(1:5) + as.cycle(100:101))

size(id)



