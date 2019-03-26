library(elliptic)


### Name: divisor
### Title: Number theoretic functions
### Aliases: divisor primes factorize mobius totient liouville
### Keywords: math

### ** Examples

mobius(1)
mobius(2)
divisor(140)
divisor(140,3)


plot(divisor(1:100,k=1),type="s",xlab="n",ylab="divisor(n,1)")

plot(cumsum(liouville(1:1000)),type="l",main="does the function ever exceed zero?")



