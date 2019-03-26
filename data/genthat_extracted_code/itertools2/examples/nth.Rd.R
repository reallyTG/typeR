library(itertools2)


### Name: nth
### Title: Returns the nth item of an iterator
### Aliases: nth

### ** Examples

it <- iterators::iter(1:10)
# Returns 5
nth(it, 5)

it2 <- iterators::iter(letters)
# Returns 'e'
nth(it2, 5)

it3 <- iterators::iter(letters)
# Returns default value of NA
nth(it3, 42)

it4 <- iterators::iter(letters)
# Returns default value of "foo"
nth(it4, 42, default="foo")



