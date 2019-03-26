library(itertools2)


### Name: iunique_justseen
### Title: Iterator that extracts the just-seen unique elements from an
###   iterable object
### Aliases: iunique_justseen

### ** Examples

it <- ichain(rep(1,4), rep(2, 5), 4:7, 2)
it_iunique <- iunique_justseen(it)
as.list(it_iunique) # 1 2 4 5 6 7 2

it2 <- iterators::iter(c('a', 'a', "A", 'a', 'a', "V"))
it2_iunique <- iunique_justseen(it2)
as.list(it2_iunique) # a A a V



