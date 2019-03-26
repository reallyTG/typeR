library(maxLik)


### Name: sumt
### Title: Equality-constrained optimization
### Aliases: sumt
### Keywords: optimize

### ** Examples

## We maximize exp(-x^2 - y^2) where x+y = 1
hatf <- function(theta) {
   x <- theta[1]
   y <- theta[2]
   exp(-(x^2 + y^2))
   ## Note: you may prefer exp(- theta %*% theta) instead
}
## use constraints: x + y = 1
A <- matrix(c(1, 1), 1, 2)
B <- -1
res <- sumt(hatf, start=c(0,0), maxRoutine=maxNR,
            constraints=list(eqA=A, eqB=B))
print(summary(res))



