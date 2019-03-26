library(itertools2)


### Name: icompress
### Title: Iterator that filters elements where corresponding selector is
###   false.
### Aliases: icompress

### ** Examples

# Filters out odd numbers and retains only even numbers
n <- 10
selectors <- rep(c(FALSE, TRUE), n)
it <- icompress(seq_len(n), selectors)
as.list(it)

# Similar idea here but anonymous function is used to filter out even
# numbers
n <- 10
it2 <- icompress(seq_len(10), rep(c(TRUE, FALSE), n))
as.list(it2)

it3 <- icompress(letters, letters %in% c('a', 'e', 'i', 'o', 'u'))
as.list(it3)



