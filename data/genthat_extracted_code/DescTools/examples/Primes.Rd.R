library(DescTools)


### Name: Primes
### Title: Find All Primes Less Than n
### Aliases: Primes
### Keywords: math arith

### ** Examples

(p1 <- Primes(100))
system.time(p1k <- Primes(1000)) # still lightning ..

stopifnot(length(p1k) == 168)




