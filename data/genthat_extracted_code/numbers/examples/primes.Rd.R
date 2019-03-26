library(numbers)


### Name: Primes
### Title: Prime Numbers
### Aliases: Primes atkin_sieve

### ** Examples

Primes(1000)
Primes(1949, 2019)

atkin_sieve(1000)

## Not run: 
##D ##  Appendix:  Logarithmic Integrals and Prime Numbers (C.F.Gauss, 1846)
##D 
##D library('gsl')
##D # 'European' form of the logarithmic integral
##D Li <- function(x) expint_Ei(log(x)) - expint_Ei(log(2))
##D 
##D # No. of primes and logarithmic integral for 10^i, i=1..12
##D i <- 1:12;  N <- 10^i
##D # piN <- numeric(12)
##D # for (i in 1:12) piN[i] <- length(primes(10^i))
##D piN <- c(4, 25, 168, 1229, 9592, 78498, 664579,
##D          5761455, 50847534, 455052511, 4118054813, 37607912018)
##D cbind(i, piN, round(Li(N)), round((Li(N)-piN)/piN, 6))
##D 
##D #  i     pi(10^i)      Li(10^i)  rel.err  
##D # --------------------------------------      
##D #  1            4            5  0.280109
##D #  2           25           29  0.163239
##D #  3          168          177  0.050979
##D #  4         1229         1245  0.013094
##D #  5         9592         9629  0.003833
##D #  6        78498        78627  0.001637
##D #  7       664579       664917  0.000509
##D #  8      5761455      5762208  0.000131
##D #  9     50847534     50849234  0.000033
##D # 10    455052511    455055614  0.000007
##D # 11   4118054813   4118066400  0.000003
##D # 12  37607912018  37607950280  0.000001
##D # --------------------------------------
## End(Not run)



