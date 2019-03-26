library(VeryLargeIntegers)


### Name: 18. Probabilistic primality tests
### Title: Probabilistic Primality Tests for vli Objects
### Aliases: '18. Probabilistic primality tests' is.primeF
###   is.primeF.default is.primeF.numeric is.primeF.vli is.primeMR
###   is.primeMR.default is.primeMR.numeric is.primeMR.vli is.primeSS
###   is.primeSS.default is.primeSS.numeric is.primeSS.vli is.prime

### ** Examples

## Not run: 
##D ## Testing a 32 bits integer using the Miller-Rabin Test
##D is.primeMR(2845127, iter = 10)
##D 
##D ## Testing an object of class vli using the Fermat Test
##D x <- as.vli("2801401243675128975602569907852141")
##D is.primeF(x, iter = 100)
##D 
##D ## Testing the same object of class vli using the general
##D ##     is.prime function and the Solovay-Strassen Test
##D is.prime(x, iter = 100, test = "SS")
## End(Not run)



