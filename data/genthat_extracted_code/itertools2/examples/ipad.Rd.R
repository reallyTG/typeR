library(itertools2)


### Name: ipad
### Title: Iterator that returns an object followed indefinitely by a fill
###   value
### Aliases: ipad

### ** Examples

it <- iterators::iter(1:9)
it_ipad <- ipad(it)
as.list(islice(it_ipad, end=9)) # Same as as.list(1:9)

it2 <- iterators::iter(1:9)
it2_ipad <- ipad(it2)
as.list(islice(it2_ipad, end=10)) # Same as as.list(c(1:9, NA))

it3 <- iterators::iter(1:9)
it3_ipad <- ipad(it3, fill=TRUE)
as.list(islice(it3_ipad, end=10)) # Same as as.list(c(1:9, TRUE))



