library(noia)


### Name: Simulate population
### Title: Simulates a Population from a Genotype-Phenotype Map
### Aliases: simulatePop
### Keywords: datagen

### ** Examples

set.seed(123456789)

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")
str(pop)

## Create a "noia" population with genotype frequencies 1/3,1/3,1/3 for locus 1 
## and 0.2,0.6,0.2 for locus 2
pop = simulatePop(map, N=1000, sigma=1, type='noia', 
  freqmat=matrix(c(1/3,1/3,1/3,0.2,0.6,0.2),nrow=2, byrow=TRUE))



