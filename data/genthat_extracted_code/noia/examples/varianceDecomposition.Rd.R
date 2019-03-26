library(noia)


### Name: Variance decomposition
### Title: Decomposition of Genetic Variance
### Aliases: varianceDecomposition print.noia.vardec
### Keywords: models regression

### ** Examples


map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")

# Regression

linear <- linearRegression(phen=pop$phen, gen=cbind(pop$Loc1, pop$Loc2))

# Variance decomposition
varianceDecomposition(linear)



