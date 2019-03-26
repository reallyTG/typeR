library(VeryLargeIntegers)


### Name: 14. Finding a random divisor
### Title: Finding a Random Divisor of a vli Object
### Aliases: '14. Finding a random divisor' divisor divisor.default
###   divisor.numeric divisor.vli

### ** Examples

r <- rvliprime(100)
r
x <- r * 51
x
divisor(x, iter = 100)



