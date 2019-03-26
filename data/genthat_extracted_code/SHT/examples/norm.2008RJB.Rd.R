library(SHT)


### Name: norm.2008RJB
### Title: Robust Jarque-Bera Test of Univariate Normality by Gel and
###   Gastwirth (2008)
### Aliases: norm.2008RJB

### ** Examples

## generate samples from uniform distribution
x = runif(28)

## test with both methods of attaining p-values
test1 = norm.2008RJB(x, method="a") # Asymptotics
test2 = norm.2008RJB(x, method="m") # Monte Carlo 




