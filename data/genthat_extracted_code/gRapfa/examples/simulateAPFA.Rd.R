library(gRapfa)


### Name: simulateAPFA
### Title: Simulation of data from an APFA model
### Aliases: simulateAPFA

### ** Examples

library(gRapfa)
data(Wheeze)
G <- select.IC(Wheeze)
simWheeze <- simulateAPFA(G)
head(simWheeze)



