library(VineCopula)


### Name: BiCopPar2Beta
### Title: Blomqvist's Beta Value of a Bivariate Copula
### Aliases: BiCopPar2Beta

### ** Examples

## Example 1: Gaussian copula
BiCopPar2Beta(family = 1, par = 0.7)
BiCop(1, 0.7)$beta  # alternative

## Example 2: Clayton copula
BiCopPar2Beta(family = 3, par = 2)

## Example 3: different copula families
BiCopPar2Beta(family = c(3,4,6), par = 2:4)




