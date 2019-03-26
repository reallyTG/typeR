library(itertools2)


### Name: imap
### Title: Iterator that applies a given function to several iterables
###   concurrently.
### Aliases: imap

### ** Examples

pow <- function(x, y) {
  x^y
}
it <- imap(pow, c(2, 3, 10), c(5, 2, 3))
as.list(it)

# Similar to the above, but because the second vector is exhausted after two
# calls to `nextElem`, the iterator is exhausted.
it2 <- imap(pow, c(2, 3, 10), c(5, 2))
as.list(it2)

# Another similar example but with lists instead of vectors
it3 <- imap(pow, list(2, 3, 10), list(5, 2, 3))
iterators::nextElem(it3) # 32
iterators::nextElem(it3) # 9
iterators::nextElem(it3) # 1000



