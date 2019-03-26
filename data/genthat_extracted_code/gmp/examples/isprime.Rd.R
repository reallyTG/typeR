library(gmp)


### Name: isprime
### Title: Determine if number is (very probably) prime
### Aliases: isprime
### Keywords: arith

### ** Examples

isprime(210)
isprime(71)

# All primes numbers from 1 to 100
t <- isprime(1:99)
(1:99)[t > 0]

table(isprime(1:10000))# 0 and 2 : surely prime or not prime

primes <- function(n) {
  ## all primes <= n
  stopifnot(length(n) == 1, n <= 1e7) # be reasonable
  p <- c(2L, as.integer(seq(3, n, by=2)))
  p[isprime(p) > 0]
}

## quite quickly, but for these small numbers
## still slower than e.g., sfsmisc::primes()
system.time(p100k <- primes(100000))

## The first couple of Mersenne primes:
p.exp <- primes(1000)
Mers <- as.bigz(2) ^ p.exp - 1
isp.M <- sapply(seq_along(Mers), function(i) isprime(Mers[i], reps=256))
cbind(p.exp, isp.M)[isp.M > 0,]
Mers[isp.M > 0]



