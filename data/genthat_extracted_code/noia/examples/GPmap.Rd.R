library(noia)


### Name: Genotype-to-Phenotype map
### Title: Genotype-to-Phenotype Mapping
### Aliases: GPmap
### Keywords: regression

### ** Examples

set.seed(123456789)

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")

# Regression
linear <- linearRegression(phen=pop$phen, gen=cbind(pop$Loc1, pop$Loc2))

# GP map
GPmap(linear)



