library(qrandom)


### Name: qrandom
### Title: Raw sequence of true random numbers by measuring the quantum
###   fluctuations of the vacuum
### Aliases: qrandom

### ** Examples

## No test: 
## request for 10 true random numbers within the interval [0; 255]
randomNumbers <- qrandom(n = 10)

## request for 10 true random numbers within the interval [0; 65,535]
randomNumbers <- qrandom(n = 10, type = "uint16")

## request for 10 true random hexadecimal characters within the interval [00; ff]
randomNumbers <- qrandom(n = 10, type = "hex16")

## requests with data type 'hex16' are characters
class(randomNumbers)
typeof(randomNumbers)

## request for 10 true random hexadecimal numbers within the interval [0000; ffff]
randomNumbers <- qrandom(n = 10, type = "hex16", blocksize = 2)

## coerce hexadecimal random characters to hexadecimal numbers prior to numeric calculations
## calculate mean of randomNumbers
library(Rmpfr)
mean(as.hexmode(randomNumbers))
mean(mpfr(randomNumbers, base = 16))
## End(No test)



