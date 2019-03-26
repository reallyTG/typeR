library(memoise)


### Name: timeout
### Title: Return a new number after a given number of seconds
### Aliases: timeout

### ** Examples

a <- function(n) { runif(n) }
memA <- memoise(a, ~timeout(10))
memA(2)



