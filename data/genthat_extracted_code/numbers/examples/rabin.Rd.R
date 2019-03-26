library(numbers)


### Name: miller_rabin
### Title: Miller-Rabin Test
### Aliases: miller_rabin

### ** Examples

miller_rabin(2)

## Not run: 
##D   miller_rabin(4294967297)  #=> FALSE
##D   miller_rabin(4294967311)  #=> TRUE
##D 
##D   # Rabin-Miller 10 times faster than nextPrime()
##D   N <- n <- 2^32 + 1
##D   system.time(while (!miller_rabin(n)) n <- n + 1)  # 0.003
##D   system.time(p <- nextPrime(N))                    # 0.029
##D 
##D   N <- c(2047, 1373653, 25326001, 3215031751, 2152302898747,
##D           3474749660383, 341550071728321)
##D   for (n in N) {
##D       p <- nextPrime(n)
##D       T <- system.time(r <- miller_rabin(p))
##D       cat(n, p, r, T[3], "\n")}
## End(Not run)



