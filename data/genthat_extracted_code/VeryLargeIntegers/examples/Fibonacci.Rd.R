library(VeryLargeIntegers)


### Name: 23. Fibonacci numbers
### Title: Fibonacci Numbers Tools for vli Objects
### Aliases: '23. Fibonacci numbers' Fibonacci Fibonacci.default
###   Fibonacci.numeric nthFibonacci nthFibonacci.default
###   nthFibonacci.numeric nthFibonacci.vli is.Fibonacci
###   is.Fibonacci.default is.Fibonacci.numeric is.Fibonacci.vli

### ** Examples

Fibonacci(200)

n <- as.vli("50000")
nthFibonacci(n)

x <- as.vli("5358359254990966640871840")
is.Fibonacci(x)

y <- x + 1
is.Fibonacci(y)



