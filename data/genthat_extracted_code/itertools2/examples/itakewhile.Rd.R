library(itertools2)


### Name: itakewhile
### Title: Iterator that returns elements while a predicate function
###   returns TRUE
### Aliases: itakewhile

### ** Examples

# Filters out numbers exceeding 5
not_too_large <- function(x) {
  x <= 5
}
it <- itakewhile(not_too_large, 1:100)
unlist(as.list(it)) == 1:5

# Same approach but uses an anonymous function
it2 <- itakewhile(function(x) x <= 10, seq(2, 100, by=2))
unlist(as.list(it2)) == c(2, 4, 6, 8, 10)



