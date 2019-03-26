library(itertools2)


### Name: idropwhile
### Title: Iterator that drops elements until the predicate function
###   returns FALSE
### Aliases: idropwhile

### ** Examples

# Filters out numbers exceeding 3
not_too_large <- function(x) {
  x <= 3
}
it <- idropwhile(not_too_large, 1:8)
as.list(it)

# Same approach but uses an anonymous function
it2 <- idropwhile(function(x) x <= 10, seq(2, 20, by=2))
as.list(it2)



