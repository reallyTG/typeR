library(numbers)


### Name: primeFactors
### Title: Prime Factors
### Aliases: primeFactors radical

### ** Examples

  primeFactors(1002001)         # 7  7  11  11  13  13
  primeFactors(65537)           # is prime
  # Euler's calculation
  primeFactors(2^32 + 1)        # 641  6700417

  radical(1002001)              # 1001

## Not run: 
##D   for (i in 1:99) {
##D     for (j in (i+1):100) {
##D       if (coprime(i, j)) {
##D         k = i + j
##D         r = radical(i*j*k)
##D         q = log(k) / log(r)  # 'quality' of the triple
##D         if (q > 1)
##D           cat(q, ":\t", i, ",", j, ",", k, "\n")
##D         }
##D       }
##D     }
## End(Not run)



