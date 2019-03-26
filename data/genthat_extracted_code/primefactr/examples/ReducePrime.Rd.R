library(primefactr)


### Name: ReducePrime
### Title: Get the Prime Factorization.
### Aliases: ReducePrime

### ** Examples

code100 <- c(rep(0, 99), 1)
ReducePrime(c(rep(0, 99), 1), out.summary = TRUE)
primes.div <- AllPrimesUpTo(floor(sqrt(length(code100))))
ReducePrime(c(rep(0, 99), 1), primes.div = primes.div)



