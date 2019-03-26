library(copula)


### Name: dnacopula
### Title: Density Evaluation for (Nested) Archimedean Copulas
### Aliases: dnacopula dCopula,matrix,nacopula-method
###   dCopula,numeric,nacopula-method
### Keywords: distribution

### ** Examples

## Construct a twenty-dimensional Gumbel copula with parameter chosen
## such that Kendall's tau of the bivariate margins is 0.25.
theta <- copJoe@iTau(.25)
C20 <- onacopula("J", C(theta, 1:20))

## Evaluate the copula density at the point u = (0.5,...,0.5)
u <- rep(0.5, 20)
dCopula(u, C20)

## the same with Monte Carlo based on 10000 simulated "frailties"
dCopula(u, C20, n.MC = 10000)

## Evaluate the exact log-density at several points
u <- matrix(runif(100), ncol=20)
dCopula(u, C20, log = TRUE)

## Back-compatibility check
stopifnot(identical( dCopula (u, C20), suppressWarnings(
                    dnacopula(C20, u))),
          identical( dCopula (u, C20, log = TRUE), suppressWarnings(
                    dnacopula(C20, u, log = TRUE))))



