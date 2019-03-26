library(copula)


### Name: pnacopula
### Title: Evaluation of (Nested) Archimedean Copulas
### Aliases: pnacopula pCopula,matrix,nacopula-method
###   pCopula,numeric,nacopula-method
### Keywords: multivariate distribution

### ** Examples

## Construct a three-dimensional nested Joe copula with parameters
## chosen such that the Kendall's tau of the respective bivariate margins
## are 0.2 and 0.5.
theta0 <- copJoe@iTau(.2)
theta1 <- copJoe@iTau(.5)
C3 <- onacopula("J", C(theta0, 1, C(theta1, c(2,3))))

## Evaluate this copula at the vector u
u <- c(.7,.8,.6)
pCopula(u, C3)

## Evaluate this copula at the matrix v
v <- matrix(runif(300), ncol=3)
pCopula(v, C3)

## Back-compatibility check
stopifnot(identical( pCopula (u, C3), suppressWarnings(
                    pnacopula(C3, u))),
          identical( pCopula (v, C3), suppressWarnings(
                    pnacopula(C3, v))))



