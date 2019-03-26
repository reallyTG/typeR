library(itertools2)


### Name: dotproduct
### Title: Computes the dot product of two iterable objects
### Aliases: dotproduct

### ** Examples

it <- iterators::iter(1:3)
it2 <- iterators::iter(4:6)
dotproduct(it, it2) # 32

it <- iterators::iter(1:4)
it2 <- iterators::iter(7:10)
dotproduct(1:4, 7:10) # 90



