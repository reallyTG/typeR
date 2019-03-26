library(purrr)


### Name: head_while
### Title: Find head/tail that all satisfies a predicate.
### Aliases: head_while tail_while

### ** Examples

pos <- function(x) x >= 0
head_while(5:-5, pos)
tail_while(5:-5, negate(pos))

big <- function(x) x > 100
head_while(0:10, big)
tail_while(0:10, big)



