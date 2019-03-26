library(SHT)


### Name: norm.1996AJB
### Title: Adjusted Jarque-Bera Test of Univariate Normality by Urzua
###   (1996)
### Aliases: norm.1996AJB

### ** Examples

## generate samples from uniform distribution
x = runif(28)

## test with both methods of attaining p-values
test1 = norm.1996AJB(x, method="a") # Asymptotics
test2 = norm.1996AJB(x, method="m") # Monte Carlo 




