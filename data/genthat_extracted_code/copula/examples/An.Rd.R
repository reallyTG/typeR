library(copula)


### Name: An
### Title: Nonparametric Rank-based Estimators of the Pickands Dependence
###   Function
### Aliases: An.biv An Anfun
### Keywords: htest multivariate

### ** Examples

## True Pickands dependence functions
curve(A(gumbelCopula(4   ), x), 0, 1)
curve(A(gumbelCopula(2   ), x), add=TRUE, col=2)
curve(A(gumbelCopula(1.33), x), add=TRUE, col=3)

## CFG estimator
curve(An.biv(rCopula(1000, gumbelCopula(4   )), x), lty=2, add=TRUE)
curve(An.biv(rCopula(1000, gumbelCopula(2   )), x), lty=2, add=TRUE, col=2)
curve(An.biv(rCopula(1000, gumbelCopula(1.33)), x), lty=2, add=TRUE, col=3)

## Pickands estimator
curve(An.biv(rCopula(1000, gumbelCopula(4   )), x, estimator="Pickands"),
      lty=3, add=TRUE)
curve(An.biv(rCopula(1000, gumbelCopula(2   )), x, estimator="Pickands"),
      lty=3, add=TRUE, col=2)
curve(An.biv(rCopula(1000, gumbelCopula(1.33)), x, estimator="Pickands"),
      lty=3, add=TRUE, col=3)

legend("bottomleft",  paste0("Gumbel(", format(c(4, 2, 1.33)),")"),
       lwd=1, col=1:3, bty="n")
legend("bottomright", c("true", "CFG est.", "Pickands est."), lty=1:3, bty="n")

## Relationship between An.biv and An
u <- c(runif(100),0,1) # include 0 and 1
x <- rCopula(1000, gumbelCopula(4))
r <- An(x, cbind(1-u, u))
all.equal(r$CFG, An.biv(x, u))
all.equal(r$P, An.biv(x, u, estimator="Pickands"))

## A trivariate example
x <- rCopula(1000, gumbelCopula(4, dim = 3))
u <- matrix(runif(300), 100, 3)
w <- u / apply(u, 1, sum)
r <- An(x, w)

## Endpoint corrections are applied
An(x, cbind(1, 0, 0))
An(x, cbind(0, 1, 0))
An(x, cbind(0, 0, 1))




