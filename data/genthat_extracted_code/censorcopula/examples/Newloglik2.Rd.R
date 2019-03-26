library(censorcopula)


### Name: Newloglik2
### Title: likelihood function
### Aliases: Newloglik2
### Keywords: copula likelihood

### ** Examples

library(copula)

## generate sample
data <- rCopula(50, claytonCopula(2))

## return the value of log-likelihood funcion for selected params
Newloglik2(param=2, data, claytonCopula(2))




