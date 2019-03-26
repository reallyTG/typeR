library(RandomFieldsUtils)


### Name: solve
### Title: Solve a System of Equations for Positive Definite Matrices
### Aliases: solvePosDef solvex solve
### Keywords: math

### ** Examples


RFoptions(solve_method = "cholesky", printlevel=1)
set.seed(1)
n <- 1000
x <- 1:n
y <- runif(n)


## FIRST EXAMPLE: full rank matrix
M <- exp(-as.matrix(dist(x) / n)) 
b0 <- matrix(nr=n, runif(n * 5))
b <- M %*% b0 + runif(n)

## standard with 'solve'
print(system.time(z <- solve(M, b)))
print(range(b - M %*% z))
stopifnot(all(abs((b - M %*% z)) < 2e-11))

## Without pivoting:
RFoptions(pivot=PIVOT_NONE) ## (default)
print(system.time(z <- solvex(M, b)))
print(range(b - M %*% z))
stopifnot(all(abs((b - M %*% z)) < 2e-11))

## Pivoting is 35% slower here:
RFoptions(pivot=PIVOT_DO) 
print(system.time(z <- solvex(M, b)))
print(range(b - M %*% z))
stopifnot(all(abs((b - M %*% z)) < 2e-11))



## SECOND EXAMPLE: low rank matrix
M <- x %*% t(x) + rev(x) %*% t(rev(x)) + y %*% t(y)
b1 <- M %*% b0

## Without pivoting, it does not work
RFoptions(pivot=PIVOT_NONE) 
#try(solve(M, b1))
#try(solvex(M, b1))

## Pivoting works -- the precision however is reduced :
RFoptions(pivot=PIVOT_DO) 
print(system.time(z1 <- solvex(M, b1)))
print(range(b1 - M %*% z1))
stopifnot(all(abs((b1 - M %*% z1)) < 2e-6))

## Pivoting fails, when the equation system is not solvable:
b2 <- M + runif(n)
#try(solvex(M, b2))





