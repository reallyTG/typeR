library(SHT)


### Name: norm.1980JB
### Title: Univariate Test of Normality by Jarque and Bera (1980)
### Aliases: norm.1980JB

### ** Examples

## generate samples from uniform distribution
x = runif(28)

## test with both methods of attaining p-values
test1 = norm.1980JB(x, method="a") # Asymptotics
test2 = norm.1980JB(x, method="m") # Monte Carlo 




