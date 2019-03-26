library(RandomFieldsUtils)


### Name: Cholesky
### Title: Cholesky Decomposition of Positive Definite Matrices
### Aliases: cholesky chol cholx cholPosDef chol2mv tcholRHS
### Keywords: math

### ** Examples


if (FALSE) {
## This examples shows that 'cholesky' can be much faster
## than 'chol'

## creating a covariance matrix for a temporal process
covmatrix <- function(model, x) {
  x <- as.matrix(dist(x))
  return(eval(substitute(model)))
}

size <- 600
x <- runif(size, 0, size / 10)
M <- covmatrix((1 - x) * (x < 1) , x) ## Askey's model of covariance
b <- seq(0, 1, len=size)
system.time(C2 <- chol(M))
system.time(C1 <- cholx(M))
range(C2 - C1)
stopifnot(all(abs(C2 - C1) < 10^{-9}))
}



##########################
## Example showing the use of chol2mv and tcholRHS
n <- 10
M <- matrix(nc=n, runif(n^2))
M <- M %*% t(M) + diag(n)
C <- cholx(M)
set.seed(0)
v1 <- chol2mv(C, 1)
set.seed(0)
v2 <- tcholRHS(C, rnorm(n))
stopifnot(all(v1 == v2))



##########################
## The following example shows pivoted Cholesky can be used
## and the pivotation permutation can be transferred to
## subsequent Cholesky decompositions
set.seed(0)
n <- if (interactive()) 1000 else 100
x <- 1:n
y <- runif(n)
M <- x %*% t(x) + rev(x) %*% t(rev(x)) + y %*% t(y)

## do pivoting
RFoptions(pivot = PIVOT_DO)
print(system.time(C <- cholx(M)))
print(range(crossprod(C) - M))
str(C)

## use the same pivoted decomposition as in the previous decomposition
M2 <- M +  n * diag(1:n)
RFoptions(pivot = PIVOT_IDX,
          pivot_idx = attr(C, "pivot_idx"),
          pivot_actual_size = attr(C, "pivot_actual_size"))
print(system.time(C2 <- cholx(M2)))
print(range(crossprod(C2) - M2))
range((crossprod(C2) - M2) / M2)
str(C2)

## Don't show: 
RFoptions(pivot_idx = integer(0))
## End(Don't show)




