library(noia)


### Name:  NOIA package
### Title: Implementation of the Natural and Orthogonal InterAction (NOIA)
###   model
### Aliases: noia-package noia
### Keywords: package models

### ** Examples

set.seed(123456789)

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
names(map) <- genNames(2)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")

# Regressions

linear <- linearRegression(phen=pop$phen, gen=pop[2:3])

multilinear <- multilinearRegression(phen=pop$phen, gen=cbind(pop$Loc1, 
	pop$Loc2))

# Linear effects, associated variances and stderr
linear

# Multilinear effects
multilinear

# Genotype-to-phenotype map analysis
linearGP <- linearGPmapanalysis(map, reference="F2")

# Linear effects in ideal F2 population
linearGP

# Change of reference: geneticEffects in the "11" genotype (parental 1)
geneticEffects(linear, ref.genotype="P1")

# Variance decomposition
varianceDecomposition(linear)
varianceDecomposition(linearGP)

# GP maps
maps <- cbind(map, GPmap(linear)[,1], GPmap(multilinear)[,1])
colnames(maps) <- c("Actual", "Linear", "Multilinear")
maps



