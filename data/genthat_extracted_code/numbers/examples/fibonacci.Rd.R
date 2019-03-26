library(numbers)


### Name: fibonacci
### Title: Fibonacci and Lucas Series
### Aliases: fibonacci lucas

### ** Examples

fibonacci(0)                            # 0
fibonacci(2)                            # 1
fibonacci(2, sequence = TRUE)           # 1 1
fibonacci(78)                           # 8944394323791464 < 9*10^15

lucas(0)                                # 2
lucas(2)                                # 3
lucas(76)                               # 7639424778862807

# Golden ratio
F <- fibonacci(25, sequence = TRUE)     # ... 46368 75025
f25 <- F[25]/F[24]                      # 1.618034
phi <- (sqrt(5) + 1)/2
abs(f25 - phi)                          # 2.080072e-10

# Fibonacci numbers w/o iteration
  fibo <- function(n) {
    phi <- (sqrt(5) + 1)/2
    fib <- (phi^n - (1-phi)^n) / (2*phi - 1)
    round(fib)
  }
fibo(30:33)                             # 832040 1346269 2178309 3524578

for (i in -8:8) cat(lucas(i), " ")
# 47  -29  18  -11  7  -4  3  -1  2  1  3  4  7  11  18  29  47

# Lucas numbers w/o iteration
  luca <- function(n) {
    phi <- (sqrt(5) + 1)/2
    luc <- phi^n + (1-phi)^n
    round(luc)
  }
luca(0:10)
# [1]   2   1   3   4   7  11  18  29  47  76 123

# Lucas primes
#   for (j in 0:76) {
#     l <- lucas(j)
#     if (isPrime(l)) cat(j, "\t", l, "\n")
#   }
# 0   2
# 2   3
# ...
# 71  688846502588399



