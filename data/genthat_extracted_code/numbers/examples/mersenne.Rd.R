library(numbers)


### Name: mersenne
### Title: Mersenne Numbers
### Aliases: mersenne

### ** Examples

mersenne(2)

## Not run: 
##D   P <- Primes(32)
##D   M <- c()
##D   for (p in P)
##D       if (mersenne(p)) M <- c(M, p)
##D   # Next Mersenne numpers with primes are 521 and 607 (below 1200)
##D   M                       # 2   3   5    7    13      17  19  31  61  89  107
##D   gmp::as.bigz(2)^M - 1   # 3   7  31  127  8191  131071  ... 
## End(Not run) 



