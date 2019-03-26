library(noia)


### Name: Genetic regression
### Title: Linear and Multilinear Genetic Regressions
### Aliases: linearRegression multilinearRegression
### Keywords: models regression nonlinear

### ** Examples

set.seed(123456789)

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")

# Regressions

linear <- linearRegression(phen=pop$phen, gen=cbind(pop$Loc1, pop$Loc2))

multilinear <- multilinearRegression(phen=pop$phen, 
    gen=cbind(pop$Loc1, pop$Loc2))

# Linear effects, associated variances and stderr
linear

# Multilinear effects
multilinear



