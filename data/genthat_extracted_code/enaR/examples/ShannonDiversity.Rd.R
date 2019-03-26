library(enaR)


### Name: ShannonDiversity
### Title: ShannonDiversity Shannon Diversity Metrics
### Aliases: ShannonDiversity

### ** Examples


data(oyster)

## throughflow diversity
T <- enaFlow(oyster)$T
ShannonDiversity(T)

## storage (biomass) biodiversity
## X <- oyster %v% "storage"
## ShannonDiversity(X)



