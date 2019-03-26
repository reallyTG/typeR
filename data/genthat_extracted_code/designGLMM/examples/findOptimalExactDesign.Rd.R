library(designGLMM)


### Name: findOptimalExactDesign
### Title: Find optimal Completely Randomised Design using Simulated
###   Annealing
### Aliases: findOptimalExactDesign

### ** Examples


# Finding a D-optimal completely randomised design with 10 observations, three treatments
# with means 1,2, and 4 and no overdispersion.In each round of simulated annealing, we use 
# 1000 iterations

findOptimalExactDesign(numunits=10, means=c(1,2,4), sigma=0, criterion="D",iter=1000)

# Finding an A-optimal completely randomised design with 10 observations, three treatments
# with means 1,2, and 4 and no overdispersion.

findOptimalExactDesign(numunits=10, means=c(1,2,4), sigma=0, criterion="A",iter=1000)



