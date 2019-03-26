library(VineCopula)


### Name: BiCopPar2TailDep
### Title: Tail Dependence Coefficients of a Bivariate Copula
### Aliases: BiCopPar2TailDep

### ** Examples

## Example 1: Gaussian copula
BiCopPar2TailDep(1, 0.7)
BiCop(1, 0.7)$taildep  # alternative

## Example 2: Student-t copula
BiCopPar2TailDep(2, c(0.6, 0.7, 0.8), 4)

## Example 3: different copula families
BiCopPar2TailDep(c(3, 4, 6), 2)




