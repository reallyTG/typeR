library(RcppAlgos)


### Name: primeSieve
### Title: Generate Prime Integers
### Aliases: primeSieve

### ** Examples

## Primes up to a thousand
primeSieve(1000)

## Primes between 42 and 1729
primeSieve(42, 1729)

## Equivalent to 
primeSieve(1729, 42)

## Primes up to one hundred million in no time
system.time(primeSieve(10^8))

options(scipen = 50)
## Quickly generate large primes over interval
system.time(myPs <- primeSieve(10^13+10^6, 10^13))
## Object created is small
object.size(myPs)



