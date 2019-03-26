library(sets)


### Name: tuple
### Title: Tuples
### Aliases: tuple singleton pair triple as.tuple is.tuple tuple_is_ntuple
###   tuple_is_singleton tuple_is_pair tuple_is_triple
### Keywords: math

### ** Examples

## Constructor.
tuple(1,2,3, TRUE)
triple(1,2,3)
pair(Name = "David", Height = 185)
tuple_is_triple(triple(1,2,3))
tuple_is_ntuple(tuple(1,2,3,4), 4)

## Converter.
as.tuple(1:3)

## Operations.
c(tuple("a","b"), 1)
tuple(1,2,3) * tuple(2,3,4)
rep(tuple(1,2,3), 2)
min(tuple(1,2,3))
sum(tuple(1,2,3))



