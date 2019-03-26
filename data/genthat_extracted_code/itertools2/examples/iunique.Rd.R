library(itertools2)


### Name: iunique
### Title: Iterator that extracts the unique elements from an iterable
###   object
### Aliases: iunique

### ** Examples

it <- ichain(rep(1, 4), rep(2, 5), 4:7, 2)
as.list(iunique(it)) # 1 2 4 5 6 7

it2 <- iterators::iter(c('a', 'a', "A", "V"))
as.list(iunique(it2)) # a A V

x <- as.character(gl(5, 10))
it_unique <- iunique(x)
as.list(it_unique) # 1 2 3 4 5



