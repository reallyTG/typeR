library(numbers)


### Name: omega
### Title: Number of Prime Factors
### Aliases: omega Omega

### ** Examples

omega(2*3*5*7*11*13*17*19)  #=> 8
Omega(2 * 3^2 * 5^3 * 7^4)  #=> 10

## Don't show: 
stopifnot(identical(sapply(1:16, omega),
                    c(0, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2, 1)))
stopifnot(identical(sapply(1:16, Omega),
                    c(0, 1, 1, 2, 1, 2, 1, 3, 2, 2, 1, 3, 1, 2, 2, 4)))
## End(Don't show)



