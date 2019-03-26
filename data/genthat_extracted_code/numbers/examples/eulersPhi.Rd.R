library(numbers)


### Name: eulersPhi
### Title: Eulers's Phi Function
### Aliases: eulersPhi

### ** Examples

eulersPhi(9973)  == 9973 - 1                       # for prime numbers
eulersPhi(3^10)  == 3^9 * (3 - 1)                  # for prime powers
eulersPhi(12*35) == eulersPhi(12) * eulersPhi(35)  # TRUE if coprime

## Not run: 
##D x <- 1:100; y <- sapply(x, eulersPhi)
##D plot(1:100, y, type="l", col="blue",
##D                xlab="n", ylab="phi(n)", main="Euler's totient function")
##D points(1:100, y, col="blue", pch=20)
##D grid()
## End(Not run)



