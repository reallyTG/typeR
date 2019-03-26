library(cwhmisc)


### Name: factor
### Title: Create primes, factor an integer, combine factors, check if
###   prime
### Aliases: primes Eratosthenes factorN prodN allFactors is.prime PRIMES
### Keywords: math

### ** Examples

(p <- factorN( 423))
## [1,]   3 47
## [2,]   2  1
# meaning 423 = 3^2 * 47^1
prodN(p) # 423
is.prime(.Machine$integer.max) # TRUE
is.prime(16) # FALSE
## check speed of your machine
  s <- Sys.time(); p<-primes(10^4);difftime(Sys.time(),s) 
## Time difference of 1.578922 secs  on my machine  
x <- factorN(.Machine$integer.max)



