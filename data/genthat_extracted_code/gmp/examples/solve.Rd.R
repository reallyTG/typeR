library(gmp)


### Name: solve.bigz
### Title: Solve a system of equation
### Aliases: solve.bigz solve.bigq
### Keywords: arith

### ** Examples

x <- matrix(1:4,2,2)  ## standard solve :
solve(x)

q <- as.bigq(x) ## solve with rational
solve(q)

z <- as.bigz(x)
modulus(z) <- 7  ## solve in Z/7Z :
solve(z)

b <- c(1,3)
solve(q,b)
solve(z,b)

## Inversion of ("non-trivial") rational matrices :

A <- rbind(c(10, 1,  3),
           c( 4, 2, 10),
           c( 1, 8,  2))
(IA.q <- solve(as.bigq(A))) # fractions..
stopifnot(diag(3) == A %*% IA.q)# perfect

set.seed(5); B <- matrix(round(9*runif(5^2, -1,1)), 5)
B
(IB.q <- solve(as.bigq(B)))
stopifnot(diag(5) == B %*% IB.q, diag(5) == IB.q %*% B,
          identical(B, asNumeric(solve(IB.q))))



